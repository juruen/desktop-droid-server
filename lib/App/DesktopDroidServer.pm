package App::DesktopDroidServer;

=head1 NAME

App::DesktopDroidServer - A server for DesktopDroid
Memcached::libmemcache

=head1 VERSION

Version 1.0.0

=cut

our $VERSION = '1.0.0';

use Mojolicious::Lite;

my $clients = {};

sub start {
  # Receive notifications from phones
  get '/notify-call/:id' => sub {
      my ($self) = @_;
      my $id = $self->param('id');
      $self->render(text => '');
      if  (my $client = $clients->{$id}) {
          $self->app->log->debug(
              "Notify $id $client"
          );
          $client->send_message("ring");
      } else {
          $self->app->log->debug(
              "No subscriber to $id events"
          );
      }
  };

  # Subscribe to events
  websocket '/subscribe/:id' => sub {
      my $self = shift;
      my $id = $self->param('id');
      $clients->{$id} = $self;
      $self->app->log->debug("Client subscribed to $id events");
      $self->on_finish(
          sub {
              $self->app->log->debug("$id closed connection");
              delete $clients->{$id};
          }
      );
      $self->send_message("ok");
  };

  app->start;
}

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Apache::Session::libmemcached


=head1 AUTHOR

Javier Uruen Val C<< <juruen@warp.es> >>

=head1 LICENSE AND COPYRIGHT

Copyright (C) 2011 Warp Networks, S.L

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.8 or,
at your option, any later version of Perl 5 you may have available.

1;
