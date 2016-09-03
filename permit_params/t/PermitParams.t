use strict;
use warnings;
use Test::More;

use lib qw(./lib);
use PermitParams;

my $params = {
    id => 1,
    name => "hoge",
    is_enabled => 1,
    ignore_status => 1,
};

subtest "permit keys" => sub {
    my $res = permit_params($params, [qw(id name)]);
    is_deeply $res, \{
        id => 1,
        name => "hoge",
    } or diag explain $res;

    $res = permit_params($params, [qw(id name is_enabled)]);
    is_deeply $res, \{
        id => 1,
        name => "hoge",
        is_enabled => 1,
    } or diag explain $res;
};

subtest "not in params" => sub {
    my $res = permit_params($params, [qw(id name not_in_params)]);
    is_deeply $res, \{
        id => 1,
        name => "hoge",
    } or diag explain $res;
};

done_testing();
