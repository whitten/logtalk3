%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  
%  This file is part of Logtalk <http://logtalk.org/>    
%  
%  Logtalk is free software. You can redistribute it and/or modify it under
%  the terms of the FSF GNU General Public License 3  (plus some additional
%  terms per section 7).        Consult the `LICENSE.txt` file for details.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


:- initialization((
	set_logtalk_flag(report, warnings),
	logtalk_load(library(types_loader)),
	logtalk_load(lgtunit(loader)),
	logtalk_load(loader),
	current_prolog_flag(double_quotes, Value),
	set_prolog_flag(double_quotes, codes),
	logtalk_load(tests, [hook(lgtunit)]),
	tests::run,
	set_prolog_flag(double_quotes, Value)
)).
