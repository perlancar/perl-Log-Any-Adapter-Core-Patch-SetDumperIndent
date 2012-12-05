package Log::Any::Adapter::Core::Patch::SetDumperIndent;

use 5.010001;
use strict;
no warnings;
use Log::Any; # required prior to loading Log::Any::Adapter::Core

use Module::Patch 0.12 qw();
use base qw(Module::Patch);

our $VERSION = '0.01'; # VERSION

our %config;

my $_dump_one_line = sub {
    my ($value) = @_;

    return Data::Dumper->new( [$value] )->Indent( $config{-indent} )
        ->Sortkeys(1)->Quotekeys(0)->Terse(1)->Dump();
};

sub patch_data {
    return {
        v => 3,
        config => {
            -indent => {
                schema  => ['int*', in => [0, 1, 2, 3]],
                default => 0,
            },
        },
        patches => [
            {
                action      => 'replace',
                mod_version => qr/^0\.\d+$/,
                sub_name    => '_dump_one_line',
                code        => $_dump_one_line,
            },
        ],
    };
}

1;
# ABSTRACT: Set Data::Dumper indent


__END__
=pod

=head1 NAME

Log::Any::Adapter::Core::Patch::SetDumperIndent - Set Data::Dumper indent

=head1 VERSION

version 0.01

=head1 SYNOPSIS

 use Log::Any '$log';
 use Log::Any::DI1; # shortcut for use Log::Any::Adapter::Core::Patch::SetDumperIndent -indent => 1;

 $log->debug("See this data structure: %s", $some_data);

=head1 DESCRIPTION

Log::Any dumps data structures using L<Data::Dumper> with settings: Indent=0.
This is rather hard to read. This patch allows you to set the indent level
easily.

=for Pod::Coverage ^(patch_data)$

=head1 FAQ

=head1 SEE ALSO

L<Log::Any::Adapter::Core::Patch::UseDataDump>

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

