#!/usr/bin/env escript

% A palindromic number reads the same both ways. The largest palindrome
% made from the product of two 2-digit numbers is 9009 = 91 × 99.
%
% Find the largest palindrome made from the product of two 3-digit
% numbers.

-mode(compile). % Good lord, this makes a huge difference

main(_) ->
    io:format("Result: ~w~n", [next_palendrome(999, 999)]).

next_palendrome(X, Y) -> next_palendrome(X, Y, Y, 0).

next_palendrome(0, 0, _, HighSoFar) -> HighSoFar;
next_palendrome(X, 0, MaxY, HighSoFar) ->
    next_palendrome(X-1, MaxY, MaxY, HighSoFar);
next_palendrome(X, Y, MaxY, HighSoFar) ->
    Product = X * Y,
    case {Product > HighSoFar, is_palendrome(Product)} of
        {true, true} -> next_palendrome(X, Y-1, MaxY, Product);
        {_, _} -> next_palendrome(X, Y-1, MaxY, HighSoFar)
    end.

is_palendrome(N) ->
    Reversed = reverse_digits(N),
    N == Reversed.

reverse_digits(From) -> reverse_digits(From, 0).
reverse_digits(0, To) -> To;
reverse_digits(From, To) ->
    Digit = From rem 10,
    reverse_digits((From - Digit) div 10, To * 10 + Digit).
