# ce perl -Ilocal -d:Trace test.pl

use strict;
use warnings;
use Devel::Trace 'trace';
trace 'off';

package A;
use Mouse;

has common_errors => (
    is => 'rw',
    isa => 'ArrayRef',
    default => sub { [] },
);

package B;
use Mojo::Base -base;
use Mouse;

has common_errors => (
    is => 'rw',
    isa => 'ArrayRef',
    default => sub { [] },
);

package C;
use Mojo::Base -base;
use Mouse;

has common_errors => (
    is => 'rw',
    isa => 'ArrayRef',
    default => sub { [] },
    lazy => 1,
);

package main;
use Data::Dumper;
trace 'on';

my $a = A->new;
my $b = B->new;
my $c = C->new;

# use mro;
# print Dumper(mro::get_linear_isa("A"));
# print Dumper(mro::get_linear_isa("B"));
# print Dumper(mro::get_linear_isa("C"));

# print Dumper($a->common_errors);
# print Dumper($b->common_errors);
# print Dumper($c->common_errors);

# print Dumper(Mouse::Util::find_meta(A->new));
# print Dumper(Mouse::Util::find_meta(B->new));
# print Dumper(Mouse::Util::find_meta(C->new));

# for ($a, $b, $c) {
#     $_->common_errors;
# }
