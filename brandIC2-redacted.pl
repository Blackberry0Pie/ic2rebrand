#!/usr/bin/perl
#@file brandIC2.pl
#@author Shawn Shadrix
#Changes gravatar lookup to FIT triangle in
#  contacts.phtml, contactgroups.phtml
#adds branding to the login page in
#  LoginForm.php, login.phtml
#adds branding to the main page in
#  body.phtml
use strict;
use warnings;
use Tie::File;

my $icingaPath = '[redacted]';
my $FITavatar = "fit-avatar.png";
my $FITlogo = "fit-logo.png";
my $FITlogoMain = "fit-logo-dev.png";
my $FITloginText = "IC2NA-DEV    DEVELOPMENT/DEMO SERVER";
my $find = "";
my $replace = "";
my $filename = "";

$filename = "$icingaPath/[redacted]";
tie my @array, 'Tie::File', $filename or die $!;

foreach my $line(@array)
{
    if ($line =~ /gravatar/) {
        $line = "            <?= \$this->img('/img/$FITavatar'); ?>"
    }
}

$filename = "$icingaPath/[redacted]";
tie @array, 'Tie::File', $filename or die $!;

foreach my $line(@array)
{
    if ($line =~ /gravatar/) {
        $line = "            <?= \$this->img('/img/$FITavatar'); ?>"
    }
}

$filename = "$icingaPath/[redacted]";
tie @array, 'Tie::File', $filename or die $!;

foreach my $line(@array)
{
    $find = "translate('Username')";
    $replace = "translate('FITADS01\\\\')";
    $line =~ s/\Q$find\E/$replace/g;
    
    $find = "translate('Please enter your username...')";
    $replace = "translate('it[user] username ...')";
    $line =~ s/\Q$find\E/$replace/g;
    
    $find = "translate('Password')";
    $replace = "translate(' PASSWORD')";
    $line =~ s/\Q$find\E/$replace/g;
    
    $find = "translate('...and your password')";
    $replace = "translate('it[user] password ...')";
    $line =~ s/\Q$find\E/$replace/g;
}

$filename = "$icingaPath/[redacted]";
tie @array, 'Tie::File', $filename or die $!;

foreach my $line(@array)
{
    if ($line =~ /logo_icinga_big/) {
        $line = "    <img aria-hidden=\"true\" class=\"fade-in one\" src=\"<?= \$this->baseUrl('img/$FITlogo'); ?>\" alt=\"<?= \$this->translate('The FIT logo'); ?>\" >";
    }
    
    $find = "Welcome to Icinga Web 2";
    $replace = $FITloginText;
    $line =~ s/\Q$find\E/$replace/g;
    
    if ($line =~ /<div class="footer">Icinga Web 2/) {
        $line = "    <div class=\"footer\"><img src=\"<?= \$this->baseUrl('img/logo_icinga.png'); ?>\" alt=\"<?= \$this->translate('The Icinga logo'); ?>\" ><br>\n      Icinga Web 2 &copy; 2013-2015<br>\n      <a href=\"https://www.icinga.org\"><?= \$this->translate('The Icinga Project'); ?></a>\n    </div>";
    }
}

$filename = "$icingaPath/[redacted]";
tie @array, 'Tie::File', $filename or die $!;

foreach my $line(@array)
{
    $find = "logo_icinga-inv.png";
    $replace = $FITlogoMain;
    $line =~ s/\Q$find\E/$replace/g;
}
