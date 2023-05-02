Probably don't use this repository.


# G7xxPlugin

This is an experimental set of rustler nifs that implements a simple G711 encoder and decoder function for audio devices that use said codec.

- Nothing is guaranteed, very much a WIP.
- The idea is that with the membrane swresampler plugin, we can now universally encode and decode G711 payloads. I've set this up with an RTP stream in mind, so the idea is that it should sit before your Membrane.PortAudio source and sink children.
- I do believe the implementation is correct, but as of yet I haven't validated that against a real world audio case.

