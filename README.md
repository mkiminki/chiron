# chiron
Tools for reducing fiber-mode spectra from the CHIRON echelle spectrograph.

**ecMaster** = IRAF database file containing ThAr wavelengh-to-pixel relation for arc-lamp spectra.  For use with IRAF's `ecreidentify`.

**splitstep.pro** = IDL program that creates an IRAF .cl script to speed up the step of splitting the spectrum, trimming the bad edges, and re-merging the spectra into a single file.
