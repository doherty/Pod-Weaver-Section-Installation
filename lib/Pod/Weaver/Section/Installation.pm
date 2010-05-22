use strict;  # keep [TestingAndDebugging::RequireUseStrict] happy
package Pod::Weaver::Section::Installation;

# ABSTRACT: Add an INSTALLATION pod section
use Moose;
with 'Pod::Weaver::Role::Section';
use namespace::autoclean;
use Moose::Autobox;

sub weave_section {
    my ($self, $document) = @_;
    $document->children->push(
        Pod::Elemental::Element::Nested->new(
            {   command  => 'head1',
                content  => 'INSTALLATION',
                children => [
                    Pod::Elemental::Element::Pod5::Ordinary->new(
                        {   content =>
'See perlmodinstall for information and options on installing Perl modules.'
                        }
                    ),
                ],
            }
        ),
    );
}
1;

=pod

=for test_synopsis
1;
__END__

=head1 SYNOPSIS

In C<weaver.ini>:

    [Installation]

=head1 OVERVIEW

This section plugin will produce a hunk of Pod that describes how to install
the distribution.

=function weave_section

adds the C<INSTALLATION> section.
