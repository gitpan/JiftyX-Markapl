package JiftyX::Markapl::Handler;
use strict;
use parent qw/Jifty::View/;

sub new {
    my $class = shift;
    my $self = {};
    bless $self,$class;
    my $template_class = Jifty->config->framework("TemplateClass");

    Jifty->handler->buffer( Markapl->buffer );
    return $self;
}

sub show {
    my $self     = shift;
    my $template = shift;
    my $template_class = Jifty->config->framework("TemplateClass");

    $template_class->render($template);
    Jifty->handler->buffer->clear;
    return '';
}

sub template_exists {
    my $pkg = shift;
    my $template = shift;
    my $template_class = Jifty->config->framework("TemplateClass");
    if ($template_class->can($template)) {
        return $template;
    }
}

1;
