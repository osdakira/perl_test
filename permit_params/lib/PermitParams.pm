package PermitParams;
use strict;
use warnings;
use List::Compare;

use Exporter 'import';
our @EXPORT = qw/permit_params/;

sub permit_params {
    my ($params, $permitted_keys) = @_;
    my @param_keys = keys %$params;
    my $lc = List::Compare->new(\@param_keys, $permitted_keys);
    my @unpermited_params = $lc->get_unique;
    if(@unpermited_params) {
        print STDERR "Unpermitted params: " . join(",", @unpermited_params);
    }
    return \{%{$params}{$lc->get_intersection}};
}

1;
