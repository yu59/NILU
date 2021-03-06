use strict;
use warnings;
use LWP::UserAgent;
use WWW::Mechanize;
use WWW::Mechanize::TreeBuilder;
use Encode;
use utf8;
my $mech = WWW::Mechanize->new();
WWW::Mechanize::TreeBuilder->meta->apply($mech);
$mech->get('https://nilu-is.appspot.com');
my @items = $mech->look_down("class"=>"col-md-4 sidebar")->find("li");
print encode("utf8",$_->as_text) . "\n" for @items;
# print $mech->content();
