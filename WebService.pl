use strict;
use warnings;
use Encode;
use utf8;
use WebService::Simple;
use JSON;
use Data::Dumper;

use constant BASEURL => 'http://weather.livedoor.com/forecast/webservice/json/v1';

my $agent = WebService::Simple->new(
 base_url => BASEURL,
 response_parser => 'JSON',
);

my $city_id = '011000';

my $nef = $agent->get({city => $city_id});
my $json = $nef->is_success ? decode_json($nef->{_content}):"";

print Encode::encode_utf8($json->{location}->{area}),"\n";
print Encode::encode_utf8($json->{location}->{prefecture}),"\n";
print Encode::encode_utf8($json->{location}->{city}),"\n";

foreach my $weather (@{$json->{forecasts}}){
 print Encode::encode_utf8($weather->{dateLabel}),":", Encode::encode_utf8($weather->{telop}),"\n";
}




