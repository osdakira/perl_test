package Othello::Web::Controller::Example;
use Mojo::Base 'Mojolicious::Controller';
use Othello::Service::Container qw/container/;

# This action will render a template
sub welcome {
  my $self = shift;

  $self->app->log->debug("debug test");
  # Render template "example/welcome.html.ep" with message
  # $self->app->log->debug(container->get("ui_conf"));
  $self->render(msg => 'Welcome to the Mojolicious real-time web framework!');
}

sub post_test {
    my $self = shift;
    my $params = $self->req->params->to_hash;
    $self->app->log->debug($params);
    $self->redirect_to('/');
}

1;
