%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  
%  This file is part of Logtalk <http://logtalk.org/>
%  
%  Logtalk is free software. You can redistribute it and/or modify it under
%  the terms of the FSF GNU General Public License 3  (plus some additional
%  terms per section 7).        Consult the `LICENSE.txt` file for details.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


:- object(tests,
	extends(lgtunit)).

	:- info([
		version is 1.0,
		author is 'Paulo Moura',
		date is 2014/10/14,
		comment is 'Unit tests for the ISO Prolog standard log/1 built-in function.'
	]).

	:- uses(lgtunit, [
		op(700, xfx, '=~='), '=~='/2
	]).

	% tests from the ISO/IEC 13211-1:1995(E) standard, section 9.3.6.4

	succeeds(iso_log_1_01) :-
		{X is log(1.0)},
		X == 0.0.

	succeeds(iso_log_1_02) :-
		{E is log(2.71828)},
		E =~= 1.0.

	throws(iso_log_1_03, error(instantiation_error,_)) :-
		{_X is log(_N)}.

	throws(iso_log_1_04, error(evaluation_error(undefined),_)) :-
		{_X is log(0)}.

	throws(iso_log_1_05, error(type_error(evaluable,foo/0),_)) :-
		{_X is log(foo)}.

	throws(iso_log_1_06, error(evaluation_error(undefined),_)) :-
		{_X is log(0.0)}.

:- end_object.
