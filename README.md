# Security

## Envelope Management

Envelopes are locked by default which means that visiting the envelope's URL will not provide access to it.
The envelope's password is required to unlock it for a browsing session
…

## Unsealing

Although we make every effort to ensure that an envelope is not unsealed without _authorization_,
the application is not designed to _authenticate_ the reader of the its contents.
It is highly recommended to encrypt the contents of the envelope with the PGP public key of the intended recipient
to protect it from prying eyes. If you haven't done this before, a service like https://keybase.io/ may help.

To repeat: our fundamental role is to notify you when _authorized_ access occurs
(which, by definition, means that the correct token was used) regardless of who might posses that token.

