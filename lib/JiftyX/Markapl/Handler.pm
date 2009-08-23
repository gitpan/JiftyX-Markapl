package JiftyX::Markapl::Handler;
use strict;
use parent qw/Jifty::View/;

sub new {
    my $class = shift;
    my $self = {};
    bless $self,$class;
    my $template_class = Jifty->config->framework("TemplateClass");

    {
        no warnings 'redefine';
        *Jifty::Web::out = sub {
            shift;
            my $str = shift;
            $template_class->can("outs_raw")->($str);
        };
    }

    return $self;
}

sub show {
    my $self     = shift;
    my $template = shift;
    my $template_class = Jifty->config->framework("TemplateClass");

    Jifty->handler->buffer->clear;
    my $out = $template_class->render($template);
    Jifty->handler->buffer->append($out);
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
