use strict;
use warnings;
use Net::Twitter;
use Encode;
use utf8;
use WebService::Simple;

my $consumer_key = 'rLWCsQWM8nERcufgq3UMMdDhw';
my $consumer_secret = 'OVhSUdUdrKi1ysd8HSKzSN3hhbHBScwY5IsjTIFXz4M1scyjnv';
my $token = '2427562729-2MxmeksVwDlV6ZfXlAQyIc3rpyWvrq92y7PeF9g';
my $token_secret = '2006tVnULJjEUCE7lnTQTY61Welfo2Us8Elhf5wfNxauN';

my $nt = Net::Twitter->new(
  ssl => 1,
  traits => ['API::RESTv1_1'],
  consumer_key => $consumer_key,
  consumer_secret => $consumer_secret,
  access_token => $token,
  access_token_secret => $token_secret,
);

my $res = $nt->mentions();

use Data::Dumper;

#print Dumper $res;

my $screen_name;

foreach my $mention(@$res){
 $screen_name = $mention->{user}->{screen_name};
 my $name = $mention->{user}->{name};
 my $userid = $mention->{user}->{id};
 print $screen_name,"\n";
 print $userid,"\n";
}

my $reply = "返事だよ、ありがとう！";
my $result = $nt->update("@"."$screen_name $reply");









