#!/usr/bin/perl
use strict;
use warnings;
use LWP::UserAgent;
use HTTP::Request;
use Term::ANSIColor;
use Time::HiRes qw(usleep);
use utf8;
binmode(STDOUT, ":utf8");

sub ascii_art {
    print color('bold red');
    print q{
  ____             _                  _       _   _ _______________ 
 |  _ \  __ _ _ __| | _____  ___ _ __(_)_ __ | |_/ |___ /___ /___  |
 | | | |/ _` | '__| |/ / __|/ __| '__| | '_ \| __| | |_ \ |_ \  / / 
 | |_| | (_| | |  |   <\__ \ (__| |  | | |_) | |_| |___) |__) |/ /  
 |____/ \__,_|_|  |_|\_\___/\___|_|  |_| .__/ \__|_|____/____//_/   
                                       |_|                          
    };
    print color('bold green');
    print "Coder By: RootAyyildiz Turkish Hacktivist\n";
    print color('reset');
}

print color('bold yellow');
print "URL girin (http:// veya https:// ile baslayin): ";
print color('reset');
my $host = <STDIN>;
chomp $host;

if ($host !~ /^https?:\/\//) {
    $host = "http://$host";
}

my $dizin_dosyasi = 'dizin.txt';
open(my $dfh, '<:encoding(UTF-8)', $dizin_dosyasi) or die "Dizin dosyası acilamadi: $!";
my @directories = <$dfh>;
chomp @directories;
close($dfh);

ascii_art();
print color('bold yellow');
print "\nDizinler taraniyor...\n\n";
print color('reset');

my $ua = LWP::UserAgent->new;
$ua->timeout(10);
my @found_dirs;

foreach my $dir (@directories) {
    $dir .= '/' unless $dir =~ /\/$/;
    my $full_url = $host . $dir;
    
    my $request = HTTP::Request->new(GET => $full_url);
    my $response = $ua->request($request);
    usleep(500000); 
    
    if ($response->code == 200 && $response->content !~ /404|500/ && $response->title !~ /404|500/) {
        print color('bold green');
        print "Bulundu: $full_url\n";
        print color('reset');
        push @found_dirs, $full_url;
    } elsif ($response->code == 403) {
        print color('bold yellow');
        print "Bulundu: $full_url => Erisim Engellendi (403)\n";
        print color('reset');
        push @found_dirs, $full_url;
    } elsif ($response->code == 401) {
        print color('bold yellow');
        print "Bulundu: $full_url => Kimlik Dogrulama Gerekli (401)\n";
        print color('reset');
        push @found_dirs, $full_url;
    } else {
        print color('bold red');
        print "Bulunmadi: $full_url (Kod: " . $response->code . ")\n";
        print color('reset');
    }
}

if (@found_dirs) {
    open(my $fh, '>:encoding(UTF-8)', 'bulunan_dizinler.txt') or die "Bulunan dizinler dosyası acılamadı: $!";
    print $fh join("\n", @found_dirs);
    close($fh);
    print color('bold cyan');
    print "\nBulunan dizinler 'bulunan_dizinler.txt' dosyasına kaydedildi.\n";
    print color('reset');
} else {
    print color('bold magenta');
    print "\nHiçbir dizin bulunmadi.\n";
    print color('reset');
}
