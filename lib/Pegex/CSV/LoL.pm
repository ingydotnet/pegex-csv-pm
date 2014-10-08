package Pegex::CSV::LoL;
use Pegex::Base;
extends 'Pegex::Tree';

sub got_row {
    my ($self, $got) = @_;
    $self->flatten($got);
}

sub got_double {
    my ($self, $got) = @_;
    $got =~ s/""/"/g;
    return length $got ? $got : '"';
}

sub got_plain {
    my ($self, $got) = @_;
    $got =~ s/^ *(.*?) *$/$1/;
    return $got;
}

1;
