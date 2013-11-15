function h = multiplot(varargin)
% h = multiplot(varargin)
%
% Plots multiple traces in the current plot by looking for ',' in the
% argument list and interpreting everything in between as arguments to
% consecutive plot calls. The handles to all of the plots are returned
% in h.

% Look for the commas
args = varargin;
indBreak = find(cellfun(@(x) isequal(x,','), args));
if (isempty(indBreak))
  plot(args{:});
else
  indBreak = [indBreak numel(args)+1];
  pos = 1;
  h = 0*indBreak;
  for i = 1:numel(indBreak)
    thisArgs = args(pos:indBreak(i)-1);
    h(i) = plot(thisArgs{:}); hold on;
    pos = indBreak(i)+1;
  end
  hold off;
end
    
    
    
    
