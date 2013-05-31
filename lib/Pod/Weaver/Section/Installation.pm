use strict;  # keep [TestingAndDebugging::RequireUseStrict] happy
use warnings;
package Pod::Weaver::Section::Installation;
# VERSION
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

=head1 SYNOPSIS

In C<weaver.ini>:

    [Installation]

=for test_synopsis
1;
__END__

=head1 OVERVIEW

This section plugin will produce a hunk of Pod that describes how to install
the distribution.

=head1 METHODS

=head2 weave_section

Adds the C<INSTALLATION> section.
