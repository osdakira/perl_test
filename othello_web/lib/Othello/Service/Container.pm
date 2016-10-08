package Othello::Service::Container;
use Object::Container '-base';
use Config::YAML;

register ui_conf => sub {
    $_[0]->read_yaml_config();
};

sub read_yaml_config {
    my ($self, $path) = @_;
    my @filenames = (
        "./config.yaml"
    );
    my $config;
    for my $filename (@filenames) {
        next unless -f $filename;
        $config ? $config->read($filename) : ($config = Config::YAML->new(config => $filename));
    }
    $config;
}

1;
