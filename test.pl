use Data::Dumper;
use List::Compare;

my $params = {
    id => 1,
    name => "hoge",
    is_enabled => 1,
    ignore_status => 1,
};

sub permit_params {
    my ($params, $permitted_keys) = @_;
    my $new_params = {};
    my $unpermitted_keys = [];
    for my $key (keys $params) {
        if(grep { $key eq $_ } @$permitted_keys) {
        if (defined $params->{$_}) {
            $new_params->{$_} = $params->{$_};
        } else {
            push @$unpermitted_keys, $_;
        }
    }
    print Dumper @$unpermitted_keys;
    # print join(",", @$unpermitted_keys) if @$unpermitted_keys;
    return $new_params;
}

print Dumper permit_params($params, [qw(id name)]);
# print Dumper permit_params($params, [qw(id name not_post)]);
