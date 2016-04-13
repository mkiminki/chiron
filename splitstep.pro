pro splitstep,date

; PURPOSE:  Speed up trimming step of CHIRON data reduction.  This
;           program is run from the main reduced/ directory.  The IRAF
;           .cl script it creates is run from within the folder for a
;           given date.  Assumes my naming convention for reduced
;           files.
;
; INPUT:    date    Name of folder with current night's data.
;                   (My convention is a six-digit date, e.g., '141105')


openw,3,date +'/step18.cl'

spawn,'ls -1 ' + date + '/*combined.fits',names_combined

for ii=0,n_elements(names_combined)-1 do begin

   name_root = strmid(names_combined[ii],0,strlen(names_combined[ii])-13)
   name_combinedn = name_root + 'combined.n.fits'
   name_split = name_root + 'split'
   name_splitn = name_root + 'split.n'

   command1 = 'scopy ../' + names_combined[ii] + '[11:1028,*] ../' + $
              name_split + ' format=oned'

   command2 = 'scopy ../' + name_combinedn + '[11:1028,*] ../' + $
              name_splitn + ' format=oned'

   printf,3,format='(A)',command1
   printf,3,format='(A)',command2

endfor


printf,3,format='(A)','imcopy obj*split*.0034*[1:918] obj*split*.0034*'
printf,3,format='(A)','imcopy obj*split*.006*[41:1018] obj*split*.006*'
printf,3,format='(A)','imcopy obj*split*.007*[41:1018] obj*split*.007*'


for ii=0,n_elements(names_combined)-1 do begin

   name_root = strmid(names_combined[ii],0,strlen(names_combined[ii])-13)
   name_split = name_root + 'split'
   name_splitn = name_root + 'split.n'
   name_tidy = name_root + 'tidy'
   name_tidyn = name_root + 'tidy.n'

   command3 = 'scopy ../' + name_split + '.0* ../' + name_tidy $
              + ' format=multi'
   command4 = 'scopy ../' + name_splitn + '.0* ../' + name_tidyn $
              + ' format=multi'

   printf,3,format='(A)',command3
   printf,3,format='(A)',command4

endfor

close,3


return
end
