#!/opt/local/bin/perl5
use Lingua::EN::Numbers qw(num2en num2en_ordinal);
for ($i = 1; $i <= 1000; $i++){ print num2en($i); }
