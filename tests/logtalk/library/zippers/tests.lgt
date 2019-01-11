%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  
%  This file is part of Logtalk <https://logtalk.org/>  
%  Copyright 1998-2019 Paulo Moura <pmoura@logtalk.org>
%  
%  Licensed under the Apache License, Version 2.0 (the "License");
%  you may not use this file except in compliance with the License.
%  You may obtain a copy of the License at
%  
%      http://www.apache.org/licenses/LICENSE-2.0
%  
%  Unless required by applicable law or agreed to in writing, software
%  distributed under the License is distributed on an "AS IS" BASIS,
%  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%  See the License for the specific language governing permissions and
%  limitations under the License.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


:- object(tests,
	extends(lgtunit)).

	:- info([
		version is 0.1,
		author is 'Paulo Moura',
		date is 2019/01/11,
		comment is 'Unit tests for the "zippers" library.'
	]).

	test(zlist_zip_2_01) :-
		\+ zlist::zip([], _).

	test(zlist_unzip_2_02) :-
		zlist::zip([1,2,3,4,5], Zipper),
		zlist::unzip(Zipper, List),
		List == [1,2,3,4,5].

	test(zlist_current_2_01) :-
		zlist::zip([1,2,3,4,5], Zipper),
		zlist::current(Zipper, Current),
		Current == 1.

	test(zlist_next_2_01) :-
		zlist::zip([1], Zipper),
		\+ zlist::next(Zipper, _).

	test(zlist_next_2_02) :-
		zlist::zip([1,2,3,4,5], Zipper0),
		zlist::next(Zipper0, Zipper1),
		zlist::current(Zipper1, Current),
		Current == 2.

	test(zlist_next_3_01) :-
		zlist::zip([1], Zipper),
		\+ zlist::next(Zipper, _, _).

	test(zlist_next_3_02) :-
		zlist::zip([1,2,3,4,5], Zipper0),
		zlist::next(Zipper0, _, Current),
		Current == 2.

	test(zlist_previous_2_01) :-
		zlist::zip([1,2,3,4,5], Zipper),
		\+ zlist::previous(Zipper, _).

	test(zlist_previous_2_02) :-
		zlist::zip([1,2,3,4,5], Zipper0),
		zlist::next(Zipper0, Zipper1),
		zlist::previous(Zipper1, Zipper2),
		zlist::current(Zipper2, Current),
		Current == 1.

	test(zlist_previous_3_01) :-
		zlist::zip([1,2,3,4,5], Zipper),
		\+ zlist::previous(Zipper, _, _).

	test(zlist_previous_3_02) :-
		zlist::zip([1,2,3,4,5], Zipper0),
		zlist::next(Zipper0, Zipper1),
		zlist::previous(Zipper1, _, Current),
		Current == 1.

	test(zlist_apply_2_01) :-
		zlist::zip([1,2,3,4,5], Zipper),
		zlist::apply({M}/[N]>>(M is N + 1), Zipper),
		M == 2.

	test(zlist_replace_3_01) :-
		zlist::zip([1,2,3,4,5], Zipper0),
		zlist::replace(Zipper0, 0, Zipper1),
		zlist::current(Zipper1, Current),
		Current = 0.

	test(zlist_insert_before_3_01) :-
		zlist::zip([1,2,3,4,5], Zipper0),
		zlist::insert_before(Zipper0, 0, Zipper1),
		zlist::previous(Zipper1, Zipper2),
		zlist::current(Zipper2, Current),
		Current = 0.

	test(zlist_insert_after_3_01) :-
		zlist::zip([1,3,5,7,9], Zipper0),
		zlist::insert_after(Zipper0, 2, Zipper1),
		zlist::next(Zipper1, Zipper2),
		zlist::current(Zipper2, Current),
		Current == 2.

:- end_object.
