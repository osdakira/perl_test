package Othello::Web;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
  my $self = shift;

  # Documentation browser under "/perldoc"
  $self->plugin('PODRenderer');

  $self->plugin('AssetPack' => {pipes => [qw/Css Sass/]});
  $self->asset->process('base.css' => ('sass/base.sass'));
  # $self->secrets(["secrets_key"]);

  $self->plugin('Mojolicious::Plugin::Config');

  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to('example#welcome');
  $r->post('/post_test')->to('example#post_test');
}

1;
