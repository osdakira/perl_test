package Othello::Web::Controller::Example;
use Mojo::Base 'Mojolicious::Controller';
use Othello::Service::Container qw/container/;

# This action will render a template
sub welcome {
  my $self = shift;

  $self->app->log->debug("debug test");
  # Render template "example/welcome.html.ep" with message
  $self->app->log->debug(container->get("ui_conf"));
  $self->render(msg => 'Welcome to the Mojolicious real-time web framework!');
}

1;
