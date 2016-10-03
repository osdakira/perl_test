package MyContainer;
use Object::Container '-base';
use Config::YAML;

register ui_conf => sub {
    $_[0]->read_yaml_config('ui/config.yaml');
};

sub read_yaml_config {
    my ($self, $path) = @_;
    # (my $local_path = $path) =~ s/(?=\.ya?ml)/_local/;
    # # my $home = $self->get('home');
    # my $home = ".";
    my @filenames = (
        "./ui/config.yaml"
    );
    my $config;
    for my $filename (@filenames) {
        next unless -f $filename;
        $config ? $config->read($filename)
            : ($config = Config::YAML->new(config => $filename));
    }
    $config;
}

1;
