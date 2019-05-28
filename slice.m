% extractSlice extracts an arbitray slice from a volume.
% [slice, sliceInd, subX, subY, subZ] = extractSlice extracts an arbitrary 
% slice given the center and normal of the slice.  The function outputs the 
% intensities, indices and the subscripts of the slice base on the input volume.
% If you are familiar with IDL, this is the equivalent function to EXTRACT_SLICE.
% 
% Note that output array 'sliceInd' contains integers and NaNs if the particular
% locations are outside the volume, while output arrays 'subX, subY, subZ' 
% contain floating points and does not contain NaNs when locations are
% outside the volume.

%Example:
%Extracts slices from a mri volume by varying the slice orientation from
%sagittal to transverse while shifting the center of the slice from left to right.
%(pardon me for demonstrating with an image without orientation labels and out-of-scale pixels.)

load mri;
D = squeeze(D);
for i = 0:30
pt = [64 i*2 14];
vec = [0 30-i i];
[slice, sliceInd,subX,subY,subZ] = extractSlice(D,pt(1),pt(2),pt(3),vec(1),vec(2),vec(3),64);
surf(subX,subY,subZ,slice,'FaceColor','texturemap','EdgeColor','none');
axis([1 130 1 130 1 40]);
drawnow;
end;