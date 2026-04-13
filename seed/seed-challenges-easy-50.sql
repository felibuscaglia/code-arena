-- 50 Unique Easy Challenges for CodePVP
-- Designed to be rare on other platforms and tricky for LLMs to solve correctly.

INSERT INTO challenges (id, title, difficulty, description, constraints, starter_code, test_cases, tags) VALUES

-- 1
('e1000000-0000-0000-0000-000000000001', 'Off-by-One Calendar', 'easy',
E'Given a month (1-12) and a year, return how many days are in that month.\n\nAccount for leap years: a year is a leap year if divisible by 4, **except** centuries, which must be divisible by 400.\n\nFor example, 1900 is **not** a leap year, but 2000 **is**.',
ARRAY['1 <= month <= 12', '1 <= year <= 9999'],
'{"javascript": "function daysInMonth(month, year) {\n  // your code here\n}", "python": "def days_in_month(month, year):\n    pass"}',
'{"public": [{"input": {"month": 2, "year": 2020}, "expected": 29}, {"input": {"month": 2, "year": 1900}, "expected": 28}], "hidden": [{"input": {"month": 2, "year": 2000}, "expected": 29}, {"input": {"month": 2, "year": 2100}, "expected": 28}, {"input": {"month": 4, "year": 2023}, "expected": 30}, {"input": {"month": 1, "year": 2023}, "expected": 31}, {"input": {"month": 12, "year": 1}, "expected": 31}]}',
ARRAY['math', 'conditionals']),

-- 2
('e1000000-0000-0000-0000-000000000002', 'Staircase Typo Detector', 'easy',
E'A user typed a word on a QWERTY keyboard but their fingers were shifted one key to the right. Given the mistyped string, return what they actually meant to type.\n\nUse the standard QWERTY rows:\n- Row 1: `qwertyuiop`\n- Row 2: `asdfghjkl;`\n- Row 3: `zxcvbnm,./`\n\nEach character in the input maps to the character one position to its **left** on the same row. Spaces remain as spaces. The input will only contain characters that have a valid left neighbor.',
ARRAY['1 <= s.length <= 1000', 'Characters are lowercase letters, semicolons, commas, periods, slashes, or spaces.'],
'{"javascript": "function decodeShifted(s) {\n  // your code here\n}", "python": "def decode_shifted(s):\n    pass"}',
'{"public": [{"input": {"s": "jr;;p"}, "expected": "hello"}, {"input": {"s": "vpfsmr"}, "expected": "codear"}], "hidden": [{"input": {"s": "s]p;r"}, "expected": "a[ole"}, {"input": {"s": "o ptr;"}, "expected": "i you;"}, {"input": {"s": "lpt;"}, "expected": "koji"}]}',
ARRAY['strings', 'hash-map']),

-- 3
('e1000000-0000-0000-0000-000000000003', 'Balanced Ternary', 'easy',
E'Balanced ternary is a numeral system using digits `T`, `0`, and `1`, where `T` represents -1.\n\nThe value of a balanced ternary string is computed like regular base-3, but with digit values {T=-1, 0=0, 1=1}.\n\nFor example: `1T0` = 1*9 + (-1)*3 + 0*1 = 6.\n\nGiven a balanced ternary string, return its decimal (base-10) integer value.',
ARRAY['1 <= s.length <= 20', 's consists only of characters T, 0, 1'],
'{"javascript": "function balancedTernaryToDecimal(s) {\n  // your code here\n}", "python": "def balanced_ternary_to_decimal(s):\n    pass"}',
'{"public": [{"input": {"s": "1T0"}, "expected": 6}, {"input": {"s": "1"}, "expected": 1}, {"input": {"s": "T"}, "expected": -1}], "hidden": [{"input": {"s": "10T"}, "expected": 8}, {"input": {"s": "1TT"}, "expected": 5}, {"input": {"s": "0"}, "expected": 0}, {"input": {"s": "111"}, "expected": 13}, {"input": {"s": "TTT"}, "expected": -13}]}',
ARRAY['math', 'strings']),

-- 4
('e1000000-0000-0000-0000-000000000004', 'Resistor Color Code', 'easy',
E'In electronics, resistors use colored bands to indicate their resistance value.\n\nGiven an array of 3 color band names, return the resistance in ohms.\n\n- Band 1: first digit\n- Band 2: second digit\n- Band 3: number of zeros to append (multiplier)\n\nColor values: black=0, brown=1, red=2, orange=3, yellow=4, green=5, blue=6, violet=7, grey=8, white=9.',
ARRAY['bands.length == 3', 'Each band is a valid color name (lowercase).'],
'{"javascript": "function resistorValue(bands) {\n  // your code here\n}", "python": "def resistor_value(bands):\n    pass"}',
'{"public": [{"input": {"bands": ["brown", "black", "red"]}, "expected": 1000}, {"input": {"bands": ["yellow", "violet", "orange"]}, "expected": 47000}], "hidden": [{"input": {"bands": ["black", "black", "black"]}, "expected": 0}, {"input": {"bands": ["brown", "black", "black"]}, "expected": 10}, {"input": {"bands": ["white", "white", "white"]}, "expected": 99000000000}, {"input": {"bands": ["orange", "orange", "brown"]}, "expected": 330}]}',
ARRAY['arrays', 'hash-map', 'math']),

-- 5
('e1000000-0000-0000-0000-000000000005', 'Semantic Version Compare', 'easy',
E'Given two semantic version strings `v1` and `v2` in the format `MAJOR.MINOR.PATCH`, return:\n- `1` if `v1` is greater\n- `-1` if `v2` is greater\n- `0` if they are equal\n\nCompare major first, then minor, then patch. All components are non-negative integers. Leading zeros in a component are allowed but should be treated as their numeric value (e.g., `01` equals `1`).',
ARRAY['Both versions follow the format X.Y.Z', '0 <= X, Y, Z <= 999'],
'{"javascript": "function compareVersions(v1, v2) {\n  // your code here\n}", "python": "def compare_versions(v1, v2):\n    pass"}',
'{"public": [{"input": {"v1": "1.2.3", "v2": "1.2.4"}, "expected": -1}, {"input": {"v1": "2.0.0", "v2": "1.9.9"}, "expected": 1}], "hidden": [{"input": {"v1": "1.01.0", "v2": "1.1.0"}, "expected": 0}, {"input": {"v1": "0.0.0", "v2": "0.0.0"}, "expected": 0}, {"input": {"v1": "1.0.10", "v2": "1.0.9"}, "expected": 1}, {"input": {"v1": "10.0.0", "v2": "9.99.99"}, "expected": 1}]}',
ARRAY['strings', 'math']),

-- 6
('e1000000-0000-0000-0000-000000000006', 'Run-Length Decoding', 'easy',
E'Given a run-length encoded string, decode it.\n\nThe format is: each group is a count (one or more digits) followed by a single character.\n\nFor example: `3a2b` decodes to `aaabb`.\n\nThe count is always at least 1.',
ARRAY['1 <= s.length <= 1000', 'String consists of digits and printable ASCII characters.', 'Every character group has a numeric count prefix.'],
'{"javascript": "function rleDecode(s) {\n  // your code here\n}", "python": "def rle_decode(s):\n    pass"}',
'{"public": [{"input": {"s": "3a2b"}, "expected": "aaabb"}, {"input": {"s": "1a1b1c"}, "expected": "abc"}], "hidden": [{"input": {"s": "12a"}, "expected": "aaaaaaaaaaaa"}, {"input": {"s": "3x1y2z"}, "expected": "xxxyzz"}, {"input": {"s": "1 3!"}, "expected": " !!!"}, {"input": {"s": "100a"}, "expected": "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"}]}',
ARRAY['strings', 'parsing']),

-- 7
('e1000000-0000-0000-0000-000000000007', 'Look-and-Say Sequence', 'easy',
E'The look-and-say sequence starts with `"1"` and each subsequent term is generated by describing the previous term.\n\n- `"1"` is read as "one 1" -> `"11"`\n- `"11"` is read as "two 1s" -> `"21"`\n- `"21"` is read as "one 2, one 1" -> `"1211"`\n\nGiven an integer `n`, return the `n`th term of the look-and-say sequence (1-indexed).',
ARRAY['1 <= n <= 30'],
'{"javascript": "function lookAndSay(n) {\n  // your code here\n}", "python": "def look_and_say(n):\n    pass"}',
'{"public": [{"input": {"n": 1}, "expected": "1"}, {"input": {"n": 4}, "expected": "1211"}, {"input": {"n": 5}, "expected": "111221"}], "hidden": [{"input": {"n": 2}, "expected": "11"}, {"input": {"n": 3}, "expected": "21"}, {"input": {"n": 6}, "expected": "312211"}, {"input": {"n": 7}, "expected": "13112221"}]}',
ARRAY['strings', 'simulation']),

-- 8
('e1000000-0000-0000-0000-000000000008', 'Luhn Check', 'easy',
E'The Luhn algorithm is used to validate credit card numbers and other identification numbers.\n\nGiven a string of digits, determine if it passes the Luhn check:\n\n1. From the **rightmost** digit (the check digit) moving left, **double** every second digit.\n2. If doubling results in a number greater than 9, subtract 9.\n3. Sum all the digits.\n4. If the total modulo 10 is 0, the number is valid.\n\nReturn `true` if the number is valid, `false` otherwise. Strings with fewer than 2 digits are not valid.',
ARRAY['1 <= s.length <= 20', 's consists only of digits.'],
'{"javascript": "function luhnCheck(s) {\n  // your code here\n}", "python": "def luhn_check(s):\n    pass"}',
'{"public": [{"input": {"s": "79927398713"}, "expected": true}, {"input": {"s": "79927398710"}, "expected": false}], "hidden": [{"input": {"s": "0"}, "expected": false}, {"input": {"s": "00"}, "expected": true}, {"input": {"s": "18"}, "expected": false}, {"input": {"s": "49927398716"}, "expected": true}, {"input": {"s": "1234567812345670"}, "expected": true}]}',
ARRAY['math', 'strings']),

-- 9
('e1000000-0000-0000-0000-000000000009', 'Caesar Cipher with Wraparound', 'easy',
E'Implement a Caesar cipher that shifts **only** letters by `k` positions forward in the alphabet, wrapping from z back to a.\n\nPreserve the case of each letter. Non-letter characters remain unchanged.\n\nThe shift `k` can be **negative** (shift backward) or larger than 26.',
ARRAY['0 <= s.length <= 1000', '-10^6 <= k <= 10^6'],
'{"javascript": "function caesarCipher(s, k) {\n  // your code here\n}", "python": "def caesar_cipher(s, k):\n    pass"}',
'{"public": [{"input": {"s": "abc", "k": 3}, "expected": "def"}, {"input": {"s": "Hello, World!", "k": 13}, "expected": "Uryyb, Jbeyq!"}], "hidden": [{"input": {"s": "xyz", "k": 3}, "expected": "abc"}, {"input": {"s": "ABC", "k": -1}, "expected": "ZAB"}, {"input": {"s": "test", "k": 52}, "expected": "test"}, {"input": {"s": "", "k": 5}, "expected": ""}, {"input": {"s": "Z", "k": 27}, "expected": "A"}]}',
ARRAY['strings', 'math']),

-- 10
('e1000000-0000-0000-0000-000000000010', 'Digital Root', 'easy',
E'The digital root of a non-negative integer is the single-digit value obtained by repeatedly summing its digits until only one digit remains.\n\nFor example: 493 -> 4+9+3 = 16 -> 1+6 = 7.\n\nGiven a non-negative integer `n`, return its digital root.\n\n**Challenge:** Can you do it without any loop or recursion (in O(1) time)?',
ARRAY['0 <= n <= 2^31 - 1'],
'{"javascript": "function digitalRoot(n) {\n  // your code here\n}", "python": "def digital_root(n):\n    pass"}',
'{"public": [{"input": {"n": 493}, "expected": 7}, {"input": {"n": 0}, "expected": 0}], "hidden": [{"input": {"n": 9}, "expected": 9}, {"input": {"n": 10}, "expected": 1}, {"input": {"n": 99}, "expected": 9}, {"input": {"n": 123456789}, "expected": 9}, {"input": {"n": 1}, "expected": 1}]}',
ARRAY['math']),

-- 11
('e1000000-0000-0000-0000-000000000011', 'Gray Code Neighbor Check', 'easy',
E'Two numbers are **Gray code neighbors** if their binary representations differ in exactly one bit.\n\nGiven two non-negative integers `a` and `b`, return `true` if they are Gray code neighbors, `false` otherwise.\n\nNote: A number is NOT a Gray code neighbor of itself (0 bits differ).',
ARRAY['0 <= a, b <= 2^31 - 1'],
'{"javascript": "function isGrayNeighbor(a, b) {\n  // your code here\n}", "python": "def is_gray_neighbor(a, b):\n    pass"}',
'{"public": [{"input": {"a": 5, "b": 7}, "expected": true}, {"input": {"a": 5, "b": 6}, "expected": false}], "hidden": [{"input": {"a": 0, "b": 1}, "expected": true}, {"input": {"a": 0, "b": 0}, "expected": false}, {"input": {"a": 1024, "b": 0}, "expected": true}, {"input": {"a": 15, "b": 7}, "expected": true}, {"input": {"a": 3, "b": 5}, "expected": false}]}',
ARRAY['bit-manipulation', 'math']),

-- 12
('e1000000-0000-0000-0000-000000000012', 'Morse Code Decoder', 'easy',
E'Given a Morse code string, decode it to English text.\n\nRules:\n- Letters are separated by a single space.\n- Words are separated by three spaces (`"   "`).\n- Use the standard International Morse Code mapping.\n\nMorse alphabet: A=`.-` B=`-...` C=`-.-.` D=`-..` E=`.` F=`..-.` G=`--.` H=`....` I=`..` J=`.---` K=`-.-` L=`.-..` M=`--` N=`-.` O=`---` P=`.--.` Q=`--.-` R=`.-.` S=`...` T=`-` U=`..-` V=`...-` W=`.--` X=`-..-` Y=`-.--` Z=`--..`\n\nReturn the decoded string in **uppercase**.',
ARRAY['s consists of dots, dashes, and spaces only.', 'The input is always valid Morse code.'],
'{"javascript": "function decodeMorse(s) {\n  // your code here\n}", "python": "def decode_morse(s):\n    pass"}',
'{"public": [{"input": {"s": ".... . .-.. .-.. ---"}, "expected": "HELLO"}, {"input": {"s": "... --- ..."}, "expected": "SOS"}], "hidden": [{"input": {"s": ".... ..   - .... . .-. ."}, "expected": "HI THERE"}, {"input": {"s": "-"}, "expected": "T"}, {"input": {"s": ".-   -...   -.-."}, "expected": "A B C"}, {"input": {"s": "---.- --..   ..----.----."}, "expected": "QZ IV"}]}',
ARRAY['strings', 'hash-map']),

-- 13
('e1000000-0000-0000-0000-000000000013', 'Complement Base Pairs', 'easy',
E'In DNA, nucleotide bases pair as follows: A pairs with T, and C pairs with G.\n\nGiven a DNA strand as a string, return its **reverse complement**.\n\nThe reverse complement is formed by:\n1. Taking the complement of each base (A<->T, C<->G).\n2. Reversing the resulting string.\n\nFor example: `AGTC` -> complement `TCAG` -> reverse `GACT`.',
ARRAY['1 <= s.length <= 10^5', 's consists only of characters A, T, C, G (uppercase).'],
'{"javascript": "function reverseComplement(s) {\n  // your code here\n}", "python": "def reverse_complement(s):\n    pass"}',
'{"public": [{"input": {"s": "AGTC"}, "expected": "GACT"}, {"input": {"s": "AAAA"}, "expected": "TTTT"}], "hidden": [{"input": {"s": "A"}, "expected": "T"}, {"input": {"s": "GCGC"}, "expected": "GCGC"}, {"input": {"s": "ATCGATCG"}, "expected": "CGATCGAT"}, {"input": {"s": "TTTTAAAA"}, "expected": "TTTTAAAA"}]}',
ARRAY['strings']),

-- 14
('e1000000-0000-0000-0000-000000000014', 'Zigzag Array', 'easy',
E'Given an array of distinct integers, rearrange it into a **zigzag** pattern such that:\n\n`arr[0] < arr[1] > arr[2] < arr[3] > arr[4] ...`\n\nIn other words, elements at odd indices are greater than their neighbors.\n\nIf multiple valid arrangements exist, return **any** one of them.',
ARRAY['1 <= arr.length <= 10^4', 'All elements are distinct.', '-10^5 <= arr[i] <= 10^5'],
'{"javascript": "function zigzag(arr) {\n  // your code here\n}", "python": "def zigzag(arr):\n    pass"}',
'{"public": [{"input": {"arr": [4, 3, 7, 8, 6, 2, 1]}, "expected": "__validator__zigzag"}, {"input": {"arr": [1, 2, 3]}, "expected": "__validator__zigzag"}], "hidden": [{"input": {"arr": [1]}, "expected": "__validator__zigzag"}, {"input": {"arr": [2, 1]}, "expected": "__validator__zigzag"}, {"input": {"arr": [9, 8, 7, 6, 5, 4, 3, 2, 1]}, "expected": "__validator__zigzag"}]}',
ARRAY['arrays', 'sorting', 'greedy']),

-- 15
('e1000000-0000-0000-0000-000000000015', 'Excel Column Name', 'easy',
E'Given a positive integer `n`, return the corresponding Excel column name.\n\nExcel columns are labeled: A, B, ..., Z, AA, AB, ..., AZ, BA, ..., ZZ, AAA, ...\n\nThis is essentially a bijective base-26 numeration (no zero digit).\n\nExamples: 1 -> A, 26 -> Z, 27 -> AA, 702 -> ZZ, 703 -> AAA.',
ARRAY['1 <= n <= 2^31 - 1'],
'{"javascript": "function toExcelColumn(n) {\n  // your code here\n}", "python": "def to_excel_column(n):\n    pass"}',
'{"public": [{"input": {"n": 1}, "expected": "A"}, {"input": {"n": 28}, "expected": "AB"}], "hidden": [{"input": {"n": 26}, "expected": "Z"}, {"input": {"n": 27}, "expected": "AA"}, {"input": {"n": 702}, "expected": "ZZ"}, {"input": {"n": 703}, "expected": "AAA"}, {"input": {"n": 52}, "expected": "AZ"}]}',
ARRAY['math', 'strings']),

-- 16
('e1000000-0000-0000-0000-000000000016', 'Validate IPv4', 'easy',
E'Given a string, determine if it is a valid IPv4 address.\n\nA valid IPv4 address:\n- Has exactly 4 octets separated by dots.\n- Each octet is a decimal number from 0 to 255.\n- Octets must NOT have leading zeros (e.g., `01` is invalid, but `0` is valid).\n- No extra characters allowed (no spaces, letters, etc.).',
ARRAY['0 <= s.length <= 100'],
'{"javascript": "function isValidIPv4(s) {\n  // your code here\n}", "python": "def is_valid_ipv4(s):\n    pass"}',
'{"public": [{"input": {"s": "192.168.1.1"}, "expected": true}, {"input": {"s": "256.1.1.1"}, "expected": false}], "hidden": [{"input": {"s": "0.0.0.0"}, "expected": true}, {"input": {"s": "01.0.0.0"}, "expected": false}, {"input": {"s": "1.1.1"}, "expected": false}, {"input": {"s": "1.1.1.1.1"}, "expected": false}, {"input": {"s": ""}, "expected": false}, {"input": {"s": "255.255.255.255"}, "expected": true}, {"input": {"s": "1.1.1.00"}, "expected": false}, {"input": {"s": "1..1.1"}, "expected": false}]}',
ARRAY['strings', 'parsing']),

-- 17
('e1000000-0000-0000-0000-000000000017', 'Collatz Steps', 'easy',
E'The Collatz conjecture says: start with any positive integer `n`. If `n` is even, divide by 2. If `n` is odd, multiply by 3 and add 1. Repeat until you reach 1.\n\nGiven a positive integer `n`, return the number of steps it takes to reach 1.\n\nIf `n` is already 1, return 0.',
ARRAY['1 <= n <= 10^6'],
'{"javascript": "function collatzSteps(n) {\n  // your code here\n}", "python": "def collatz_steps(n):\n    pass"}',
'{"public": [{"input": {"n": 6}, "expected": 8}, {"input": {"n": 1}, "expected": 0}], "hidden": [{"input": {"n": 2}, "expected": 1}, {"input": {"n": 3}, "expected": 7}, {"input": {"n": 27}, "expected": 111}, {"input": {"n": 1000000}, "expected": 152}]}',
ARRAY['math', 'simulation']),

-- 18
('e1000000-0000-0000-0000-000000000018', 'Pangram Checker', 'easy',
E'A **pangram** is a sentence that contains every letter of the English alphabet at least once.\n\nGiven a string `s`, return a sorted array of all **missing** lowercase letters that prevent it from being a pangram. If the string is a pangram, return an empty array.\n\nThe check is case-insensitive.',
ARRAY['1 <= s.length <= 10^4'],
'{"javascript": "function missingLetters(s) {\n  // your code here\n}", "python": "def missing_letters(s):\n    pass"}',
'{"public": [{"input": {"s": "The quick brown fox jumps over the lazy dog"}, "expected": []}, {"input": {"s": "hello"}, "expected": ["a","b","c","d","f","g","i","j","k","m","n","p","q","r","s","t","u","v","w","x","y","z"]}], "hidden": [{"input": {"s": "abcdefghijklmnopqrstuvwxy"}, "expected": ["z"]}, {"input": {"s": "ABCDEFGHIJKLMNOPQRSTUVWXYZ"}, "expected": []}, {"input": {"s": "a"}, "expected": ["b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]}]}',
ARRAY['strings', 'hash-map']),

-- 19
('e1000000-0000-0000-0000-000000000019', 'Bit Counting Staircase', 'easy',
E'Given a non-negative integer `n`, return an array where the `i`th element (0-indexed) is the number of `1` bits in the binary representation of `i`, for every `i` from 0 to `n` inclusive.\n\nFor example, for `n = 5`: binary representations are 0=0, 1=1, 10=1, 11=2, 100=1, 101=2, so return `[0, 1, 1, 2, 1, 2]`.',
ARRAY['0 <= n <= 10^5'],
'{"javascript": "function countBits(n) {\n  // your code here\n}", "python": "def count_bits(n):\n    pass"}',
'{"public": [{"input": {"n": 5}, "expected": [0,1,1,2,1,2]}, {"input": {"n": 0}, "expected": [0]}], "hidden": [{"input": {"n": 1}, "expected": [0,1]}, {"input": {"n": 2}, "expected": [0,1,1]}, {"input": {"n": 10}, "expected": [0,1,1,2,1,2,2,3,1,2,2]}, {"input": {"n": 16}, "expected": [0,1,1,2,1,2,2,3,1,2,2,3,2,3,3,4,1]}]}',
ARRAY['bit-manipulation', 'dynamic-programming']),

-- 20
('e1000000-0000-0000-0000-000000000020', 'Tower of Hanoi Moves', 'easy',
E'The Tower of Hanoi puzzle has 3 pegs and `n` disks. Return the sequence of moves needed to move all `n` disks from peg `A` to peg `C` using peg `B` as auxiliary.\n\nEach move should be represented as a string like `"A->C"` meaning move the top disk from peg A to peg C.\n\nReturn the array of all moves in order.',
ARRAY['1 <= n <= 10'],
'{"javascript": "function hanoiMoves(n) {\n  // your code here\n}", "python": "def hanoi_moves(n):\n    pass"}',
'{"public": [{"input": {"n": 1}, "expected": ["A->C"]}, {"input": {"n": 2}, "expected": ["A->B", "A->C", "B->C"]}], "hidden": [{"input": {"n": 3}, "expected": ["A->C", "A->B", "C->B", "A->C", "B->A", "B->C", "A->C"]}, {"input": {"n": 4}, "expected": ["A->B","A->C","B->C","A->B","C->A","C->B","A->B","A->C","B->C","B->A","C->A","B->C","A->B","A->C","B->C"]}]}',
ARRAY['recursion', 'simulation']),

-- 21
('e1000000-0000-0000-0000-000000000021', 'Roman Numeral Encoder', 'easy',
E'Given a positive integer, convert it to a Roman numeral string.\n\nUse standard Roman numeral rules with subtractive notation:\nM=1000, CM=900, D=500, CD=400, C=100, XC=90, L=50, XL=40, X=10, IX=9, V=5, IV=4, I=1.',
ARRAY['1 <= num <= 3999'],
'{"javascript": "function intToRoman(num) {\n  // your code here\n}", "python": "def int_to_roman(num):\n    pass"}',
'{"public": [{"input": {"num": 1994}, "expected": "MCMXCIV"}, {"input": {"num": 58}, "expected": "LVIII"}], "hidden": [{"input": {"num": 3999}, "expected": "MMMCMXCIX"}, {"input": {"num": 1}, "expected": "I"}, {"input": {"num": 4}, "expected": "IV"}, {"input": {"num": 9}, "expected": "IX"}, {"input": {"num": 444}, "expected": "CDXLIV"}, {"input": {"num": 3000}, "expected": "MMM"}]}',
ARRAY['math', 'strings']),

-- 22
('e1000000-0000-0000-0000-000000000022', 'Transpose Musical Pitch', 'easy',
E'Given a musical note as a string (e.g., `"C#"`, `"Bb"`, `"F"`) and an integer number of semitones to transpose, return the resulting note.\n\nThe chromatic scale (12 notes, sharps only): C, C#, D, D#, E, F, F#, G, G#, A, A#, B.\n\nThe semitones value can be negative (transpose down) or larger than 12. Always return the note using **sharp** notation (never flats).',
ARRAY['Note is a valid note in sharp notation.', '-120 <= semitones <= 120'],
'{"javascript": "function transpose(note, semitones) {\n  // your code here\n}", "python": "def transpose(note, semitones):\n    pass"}',
'{"public": [{"input": {"note": "C", "semitones": 4}, "expected": "E"}, {"input": {"note": "A", "semitones": 3}, "expected": "C"}], "hidden": [{"input": {"note": "B", "semitones": 1}, "expected": "C"}, {"input": {"note": "C", "semitones": -1}, "expected": "B"}, {"input": {"note": "F#", "semitones": 0}, "expected": "F#"}, {"input": {"note": "G", "semitones": 12}, "expected": "G"}, {"input": {"note": "D#", "semitones": -15}, "expected": "C#"}]}',
ARRAY['math', 'hash-map']),

-- 23
('e1000000-0000-0000-0000-000000000023', 'Scrabble Score', 'easy',
E'Compute the Scrabble score for a given word.\n\nLetter values:\n- 1 point: A, E, I, O, U, L, N, S, T, R\n- 2 points: D, G\n- 3 points: B, C, M, P\n- 4 points: F, H, V, W, Y\n- 5 points: K\n- 8 points: J, X\n- 10 points: Q, Z\n\nThe input may contain uppercase or lowercase letters. Non-letter characters score 0 points.',
ARRAY['0 <= word.length <= 100'],
'{"javascript": "function scrabbleScore(word) {\n  // your code here\n}", "python": "def scrabble_score(word):\n    pass"}',
'{"public": [{"input": {"word": "QUIZ"}, "expected": 22}, {"input": {"word": "hello"}, "expected": 8}], "hidden": [{"input": {"word": ""}, "expected": 0}, {"input": {"word": "a"}, "expected": 1}, {"input": {"word": "ZZZZZ"}, "expected": 50}, {"input": {"word": "Oxyphenbutazone"}, "expected": 41}, {"input": {"word": "123"}, "expected": 0}]}',
ARRAY['strings', 'hash-map']),

-- 24
('e1000000-0000-0000-0000-000000000024', 'Spiral Order First Ring', 'easy',
E'Given a 2D `m x n` matrix, return the elements of its **outermost ring** (border) in clockwise spiral order, starting from the top-left corner.\n\nOnly return the border elements - do not spiral inward.',
ARRAY['1 <= m, n <= 100', 'matrix[i][j] is an integer.'],
'{"javascript": "function outerRing(matrix) {\n  // your code here\n}", "python": "def outer_ring(matrix):\n    pass"}',
'{"public": [{"input": {"matrix": [[1,2,3],[4,5,6],[7,8,9]]}, "expected": [1,2,3,6,9,8,7,4]}, {"input": {"matrix": [[1,2],[3,4]]}, "expected": [1,2,4,3]}], "hidden": [{"input": {"matrix": [[1]]}, "expected": [1]}, {"input": {"matrix": [[1,2,3,4]]}, "expected": [1,2,3,4]}, {"input": {"matrix": [[1],[2],[3]]}, "expected": [1,2,3]}, {"input": {"matrix": [[1,2,3],[4,5,6]]}, "expected": [1,2,3,6,5,4]}]}',
ARRAY['arrays', 'matrix']),

-- 25
('e1000000-0000-0000-0000-000000000025', 'Braille Encoder', 'easy',
E'Braille characters are represented on a 2x3 grid of dots. Each dot is either raised (1) or flat (0).\n\nEncode a lowercase English letter as a 6-character binary string, reading the Braille cell column by column, top to bottom, left to right.\n\nThe Braille alphabet (dots numbered 1-6):\n```\n1 4\n2 5\n3 6\n```\n\nFirst 10 letters use only dots 1,2,4,5:\na=1, b=12, c=14, d=145, e=15, f=124, g=1245, h=125, i=24, j=245\n\nFor k-t, add dot 3 to a-j. For u-z (except w), add dots 3,6 to a-e; w=2456.\n\nGiven a lowercase letter, return its Braille as a 6-char string of 0s and 1s.',
ARRAY['s is a single lowercase English letter a-z.'],
'{"javascript": "function toBraille(s) {\n  // your code here\n}", "python": "def to_braille(s):\n    pass"}',
'{"public": [{"input": {"s": "a"}, "expected": "100000"}, {"input": {"s": "b"}, "expected": "110000"}], "hidden": [{"input": {"s": "c"}, "expected": "100100"}, {"input": {"s": "z"}, "expected": "101011"}, {"input": {"s": "k"}, "expected": "101000"}, {"input": {"s": "w"}, "expected": "010111"}, {"input": {"s": "e"}, "expected": "100010"}]}',
ARRAY['hash-map', 'encoding']),

-- 26
('e1000000-0000-0000-0000-000000000026', 'NATO Phonetic Alphabet', 'easy',
E'Convert a string to its NATO phonetic alphabet representation.\n\nEach letter maps to a NATO code word (case-insensitive): A=Alfa, B=Bravo, C=Charlie, D=Delta, E=Echo, F=Foxtrot, G=Golf, H=Hotel, I=India, J=Juliett, K=Kilo, L=Lima, M=Mike, N=November, O=Oscar, P=Papa, Q=Quebec, R=Romeo, S=Sierra, T=Tango, U=Uniform, V=Victor, W=Whiskey, X=Xray, Y=Yankee, Z=Zulu.\n\nNon-letter characters are kept as-is.\n\nJoin the result with spaces.',
ARRAY['0 <= s.length <= 200'],
'{"javascript": "function toNato(s) {\n  // your code here\n}", "python": "def to_nato(s):\n    pass"}',
'{"public": [{"input": {"s": "SOS"}, "expected": "Sierra Oscar Sierra"}, {"input": {"s": "Hi!"}, "expected": "Hotel India !"}], "hidden": [{"input": {"s": ""}, "expected": ""}, {"input": {"s": "a"}, "expected": "Alfa"}, {"input": {"s": "123"}, "expected": "1 2 3"}, {"input": {"s": "Go Go"}, "expected": "Golf Oscar Golf Oscar"}]}',
ARRAY['strings', 'hash-map']),

-- 27
('e1000000-0000-0000-0000-000000000027', 'ISBN-10 Validator', 'easy',
E'An ISBN-10 is valid if the weighted sum of its digits, using weights 10 through 1, is divisible by 11.\n\nThe last character may be `X` which represents 10.\n\nGiven a string, return `true` if it is a valid ISBN-10, `false` otherwise.\n\nA valid ISBN-10:\n- Has exactly 10 characters.\n- First 9 characters are digits.\n- Last character is a digit or `X`.\n- The weighted checksum is divisible by 11.',
ARRAY['0 <= s.length <= 20'],
'{"javascript": "function isValidISBN(s) {\n  // your code here\n}", "python": "def is_valid_isbn(s):\n    pass"}',
'{"public": [{"input": {"s": "0306406152"}, "expected": true}, {"input": {"s": "0306406153"}, "expected": false}], "hidden": [{"input": {"s": "030640615X"}, "expected": false}, {"input": {"s": "3-598-21508-8"}, "expected": false}, {"input": {"s": "359821507X"}, "expected": true}, {"input": {"s": ""}, "expected": false}, {"input": {"s": "1234567890"}, "expected": false}, {"input": {"s": "048665088X"}, "expected": true}]}',
ARRAY['strings', 'math']),

-- 28
('e1000000-0000-0000-0000-000000000028', 'Duplicate Encoder', 'easy',
E'Given a string, replace every character with `(` if it appears only once in the entire string, or `)` if it appears more than once.\n\nThe comparison is **case-insensitive**, but the output should have the same length as the input.\n\nIgnore nothing - spaces and special characters count too.',
ARRAY['0 <= s.length <= 1000'],
'{"javascript": "function duplicateEncode(s) {\n  // your code here\n}", "python": "def duplicate_encode(s):\n    pass"}',
'{"public": [{"input": {"s": "recede"}, "expected": "()()()"}, {"input": {"s": "Success"}, "expected": ")())())"}], "hidden": [{"input": {"s": "din"}, "expected": "((("}, {"input": {"s": "(( @"}, "expected": "))(("}, {"input": {"s": ""}, "expected": ""}, {"input": {"s": "aA"}, "expected": "))"}, {"input": {"s": "Preceptor"}, "expected": ")())()()("}]}',
ARRAY['strings', 'hash-map']),

-- 29
('e1000000-0000-0000-0000-000000000029', 'Reverse Polish Notation', 'easy',
E'Evaluate an expression in Reverse Polish Notation (postfix notation).\n\nValid operators are `+`, `-`, `*`, `/`. Each operand is an integer.\n\nDivision should **truncate toward zero** (not floor).\n\nThe input is given as an array of strings, each being either a number or an operator.\n\nYou may assume the expression is always valid.',
ARRAY['1 <= tokens.length <= 10^4', 'Each token is either a valid integer or one of +, -, *, /.', 'No division by zero.'],
'{"javascript": "function evalRPN(tokens) {\n  // your code here\n}", "python": "def eval_rpn(tokens):\n    pass"}',
'{"public": [{"input": {"tokens": ["2", "1", "+", "3", "*"]}, "expected": 9}, {"input": {"tokens": ["4", "13", "5", "/", "+"]}, "expected": 6}], "hidden": [{"input": {"tokens": ["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]}, "expected": 22}, {"input": {"tokens": ["3"]}, "expected": 3}, {"input": {"tokens": ["-7", "2", "/"]}, "expected": -3}, {"input": {"tokens": ["7", "-2", "/"]}, "expected": -3}]}',
ARRAY['stack', 'math']),

-- 30
('e1000000-0000-0000-0000-000000000030', 'Abundant, Deficient, or Perfect', 'easy',
E'A positive integer `n` is classified based on the sum of its **proper divisors** (all divisors less than `n`):\n\n- **Perfect**: sum equals `n` (e.g., 6: 1+2+3=6)\n- **Abundant**: sum exceeds `n` (e.g., 12: 1+2+3+4+6=16)\n- **Deficient**: sum is less than `n` (e.g., 8: 1+2+4=7)\n\nGiven a positive integer `n`, return `"perfect"`, `"abundant"`, or `"deficient"`.\n\nNote: 1 is deficient (its proper divisor sum is 0).',
ARRAY['1 <= n <= 10^6'],
'{"javascript": "function classify(n) {\n  // your code here\n}", "python": "def classify(n):\n    pass"}',
'{"public": [{"input": {"n": 6}, "expected": "perfect"}, {"input": {"n": 12}, "expected": "abundant"}, {"input": {"n": 8}, "expected": "deficient"}], "hidden": [{"input": {"n": 1}, "expected": "deficient"}, {"input": {"n": 28}, "expected": "perfect"}, {"input": {"n": 496}, "expected": "perfect"}, {"input": {"n": 2}, "expected": "deficient"}, {"input": {"n": 24}, "expected": "abundant"}]}',
ARRAY['math']),

-- 31
('e1000000-0000-0000-0000-000000000031', 'Kaprekar Routine Steps', 'easy',
E'The Kaprekar routine for a 4-digit number works as follows:\n1. Arrange the digits in descending order to form the largest number.\n2. Arrange the digits in ascending order to form the smallest number.\n3. Subtract the smaller from the larger.\n4. Repeat until you reach 6174 (the Kaprekar constant) or 0.\n\nPad with leading zeros to maintain 4 digits if needed (e.g., 0999 -> 9990 - 0999 = 8991).\n\nGiven a 4-digit number (not all digits identical), return the number of steps to reach 6174.\n\nIf the number is already 6174, return 0.',
ARRAY['The input has 4 digits (1000-9999 or 4-digit representation).', 'Not all digits are the same.'],
'{"javascript": "function kaprekarSteps(n) {\n  // your code here\n}", "python": "def kaprekar_steps(n):\n    pass"}',
'{"public": [{"input": {"n": 3524}, "expected": 3}, {"input": {"n": 6174}, "expected": 0}], "hidden": [{"input": {"n": 1000}, "expected": 5}, {"input": {"n": 1234}, "expected": 3}, {"input": {"n": 9998}, "expected": 5}, {"input": {"n": 8991}, "expected": 2}]}',
ARRAY['math', 'simulation']),

-- 32
('e1000000-0000-0000-0000-000000000032', 'Conway Game of Life Step', 'easy',
E'Given a 2D grid of cells (0 = dead, 1 = alive), compute the next generation according to Conway''s Game of Life rules:\n\n1. A live cell with 2 or 3 live neighbors survives.\n2. A live cell with fewer than 2 or more than 3 live neighbors dies.\n3. A dead cell with exactly 3 live neighbors becomes alive.\n\nNeighbors are the 8 surrounding cells (horizontal, vertical, diagonal). Cells outside the grid are considered dead.\n\nReturn the new grid after one step.',
ARRAY['1 <= rows, cols <= 50', 'grid[i][j] is 0 or 1.'],
'{"javascript": "function gameOfLifeStep(grid) {\n  // your code here\n}", "python": "def game_of_life_step(grid):\n    pass"}',
'{"public": [{"input": {"grid": [[0,1,0],[0,0,1],[1,1,1],[0,0,0]]}, "expected": [[0,0,0],[1,0,1],[0,1,1],[0,1,0]]}, {"input": {"grid": [[1,1],[1,1]]}, "expected": [[1,1],[1,1]]}], "hidden": [{"input": {"grid": [[0]]}, "expected": [[0]]}, {"input": {"grid": [[1]]}, "expected": [[0]]}, {"input": {"grid": [[0,0,0],[0,1,0],[0,0,0]]}, "expected": [[0,0,0],[0,0,0],[0,0,0]]}, {"input": {"grid": [[1,1,0],[1,1,0],[0,0,0]]}, "expected": [[1,1,0],[1,1,0],[0,0,0]]}]}',
ARRAY['matrix', 'simulation']),

-- 33
('e1000000-0000-0000-0000-000000000033', 'Pig Latin Translator', 'easy',
E'Convert a sentence to Pig Latin using these rules:\n\n1. If a word begins with a vowel (a, e, i, o, u), append `"way"` to the end.\n2. If a word begins with one or more consonants, move ALL leading consonants to the end, then append `"ay"`.\n3. Treat `y` at the start of a word as a consonant, but as a vowel elsewhere.\n4. Keep all words lowercase. Words are separated by single spaces.\n\nFor example: `"quick brown fox"` -> `"ickquay ownbray oxfay"`.',
ARRAY['1 <= s.length <= 1000', 's contains only lowercase letters and spaces.', 'No leading/trailing spaces, single space between words.'],
'{"javascript": "function pigLatin(s) {\n  // your code here\n}", "python": "def pig_latin(s):\n    pass"}',
'{"public": [{"input": {"s": "hello world"}, "expected": "ellohay orldway"}, {"input": {"s": "apple"}, "expected": "appleway"}], "hidden": [{"input": {"s": "quick brown fox"}, "expected": "ickquay ownbray oxfay"}, {"input": {"s": "yes"}, "expected": "esyay"}, {"input": {"s": "rhythm"}, "expected": "ythmrhay"}, {"input": {"s": "a"}, "expected": "away"}, {"input": {"s": "school"}, "expected": "oolschay"}, {"input": {"s": "try"}, "expected": "ytray"}]}',
ARRAY['strings']),

-- 34
('e1000000-0000-0000-0000-000000000034', 'Soundex Code', 'easy',
E'Implement the Soundex algorithm, which encodes names by sound so that similar-sounding names get the same code.\n\nRules:\n1. Keep the first letter (uppercase).\n2. Replace remaining letters with digits: B,F,P,V=1; C,G,J,K,Q,S,X,Z=2; D,T=3; L=4; M,N=5; R=6. Drop A,E,I,O,U,H,W,Y.\n3. If two adjacent letters map to the same digit, keep only one.\n4. Remove all occurrences of 0.\n5. Pad with zeros or truncate to make the result exactly 4 characters (1 letter + 3 digits).\n\nNote: The first letter''s coded value still participates in the adjacency dedup with the second letter.',
ARRAY['1 <= s.length <= 50', 's contains only English letters.'],
'{"javascript": "function soundex(s) {\n  // your code here\n}", "python": "def soundex(s):\n    pass"}',
'{"public": [{"input": {"s": "Robert"}, "expected": "R163"}, {"input": {"s": "Rupert"}, "expected": "R163"}], "hidden": [{"input": {"s": "Ashcraft"}, "expected": "A261"}, {"input": {"s": "Ashcroft"}, "expected": "A261"}, {"input": {"s": "Tymczak"}, "expected": "T522"}, {"input": {"s": "Pfister"}, "expected": "P236"}, {"input": {"s": "A"}, "expected": "A000"}, {"input": {"s": "Lee"}, "expected": "L000"}]}',
ARRAY['strings', 'encoding']),

-- 35
('e1000000-0000-0000-0000-000000000035', 'Sieve of Sundaram', 'easy',
E'The Sieve of Sundaram generates all prime numbers up to a given limit `n` (inclusive).\n\nAlgorithm:\n1. Start with a list of integers from 1 to `k` where `k = (n-1)/2` (integer division).\n2. Remove all numbers of the form `i + j + 2ij` where `1 <= i <= j` and `i + j + 2ij <= k`.\n3. The remaining numbers, when transformed as `2*x + 1`, give all odd primes up to `n`.\n4. If `n >= 2`, prepend 2 to the result.\n\nReturn all primes up to `n` using this specific algorithm.',
ARRAY['1 <= n <= 10000'],
'{"javascript": "function sieveOfSundaram(n) {\n  // your code here\n}", "python": "def sieve_of_sundaram(n):\n    pass"}',
'{"public": [{"input": {"n": 10}, "expected": [2,3,5,7]}, {"input": {"n": 2}, "expected": [2]}], "hidden": [{"input": {"n": 1}, "expected": []}, {"input": {"n": 20}, "expected": [2,3,5,7,11,13,17,19]}, {"input": {"n": 30}, "expected": [2,3,5,7,11,13,17,19,23,29]}, {"input": {"n": 3}, "expected": [2,3]}]}',
ARRAY['math', 'arrays']),

-- 36
('e1000000-0000-0000-0000-000000000036', 'Persistent Number', 'easy',
E'The **multiplicative persistence** of a number is the count of times you must multiply its digits together until you reach a single digit.\n\nFor example:\n- 39 -> 3*9=27 -> 2*7=14 -> 1*4=4 (persistence = 3)\n- 999 -> 729 -> 126 -> 12 -> 2 (persistence = 4)\n- 4 -> already single digit (persistence = 0)\n\nGiven a non-negative integer `n`, return its multiplicative persistence.',
ARRAY['0 <= n <= 10^9'],
'{"javascript": "function persistence(n) {\n  // your code here\n}", "python": "def persistence(n):\n    pass"}',
'{"public": [{"input": {"n": 39}, "expected": 3}, {"input": {"n": 4}, "expected": 0}], "hidden": [{"input": {"n": 999}, "expected": 4}, {"input": {"n": 25}, "expected": 2}, {"input": {"n": 0}, "expected": 0}, {"input": {"n": 10}, "expected": 1}, {"input": {"n": 77}, "expected": 4}, {"input": {"n": 679}, "expected": 5}]}',
ARRAY['math', 'simulation']),

-- 37
('e1000000-0000-0000-0000-000000000037', 'Rainwater in a Histogram', 'easy',
E'Given an array of non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.\n\nFor example, given `[0,1,0,2,1,0,1,3,2,1,2,1]`, the answer is 6 units of water.',
ARRAY['1 <= height.length <= 2 * 10^4', '0 <= height[i] <= 10^5'],
'{"javascript": "function trapWater(height) {\n  // your code here\n}", "python": "def trap_water(height):\n    pass"}',
'{"public": [{"input": {"height": [0,1,0,2,1,0,1,3,2,1,2,1]}, "expected": 6}, {"input": {"height": [4,2,0,3,2,5]}, "expected": 9}], "hidden": [{"input": {"height": [1]}, "expected": 0}, {"input": {"height": [1,2,3,4,5]}, "expected": 0}, {"input": {"height": [5,4,3,2,1]}, "expected": 0}, {"input": {"height": [3,0,3]}, "expected": 3}, {"input": {"height": [0,0,0]}, "expected": 0}]}',
ARRAY['arrays', 'two-pointers']),

-- 38
('e1000000-0000-0000-0000-000000000038', 'Bijective Base-26 Decode', 'easy',
E'Excel columns use bijective base-26 encoding: A=1, B=2, ..., Z=26, AA=27, AB=28, ..., AZ=52, BA=53, ...\n\nGiven a column label string, return its corresponding number.\n\nNote: There is no zero in this system. "A" is 1, not 0.',
ARRAY['1 <= s.length <= 7', 's consists only of uppercase English letters A-Z.'],
'{"javascript": "function columnToNumber(s) {\n  // your code here\n}", "python": "def column_to_number(s):\n    pass"}',
'{"public": [{"input": {"s": "A"}, "expected": 1}, {"input": {"s": "AB"}, "expected": 28}], "hidden": [{"input": {"s": "Z"}, "expected": 26}, {"input": {"s": "AA"}, "expected": 27}, {"input": {"s": "AZ"}, "expected": 52}, {"input": {"s": "ZZ"}, "expected": 702}, {"input": {"s": "AAA"}, "expected": 703}, {"input": {"s": "BA"}, "expected": 53}]}',
ARRAY['math', 'strings']),

-- 39
('e1000000-0000-0000-0000-000000000039', 'Minesweeper Board', 'easy',
E'Given a 2D grid where `*` represents a mine and `.` represents an empty cell, return a new grid where each empty cell shows the count of adjacent mines (0-8). Mines remain as `*`.\n\nAdjacent means the 8 surrounding cells (horizontal, vertical, diagonal).',
ARRAY['1 <= rows, cols <= 100', 'grid[i][j] is either "*" or ".".'],
'{"javascript": "function minesweeper(grid) {\n  // your code here\n}", "python": "def minesweeper(grid):\n    pass"}',
'{"public": [{"input": {"grid": [["*",".","."],[".",".","."],[".","*","."]]}, "expected": [["*","1","0"],["2","2","1"],["1","*","1"]]}, {"input": {"grid": [["*","*"],["*","*"]]}, "expected": [["*","*"],["*","*"]]}], "hidden": [{"input": {"grid": [[".",".","."],[".",".","."],[".",".","."]]},"expected": [["0","0","0"],["0","0","0"],["0","0","0"]]}, {"input": {"grid": [["*"]]}, "expected": [["*"]]}, {"input": {"grid": [["."]]}, "expected": [["0"]]}, {"input": {"grid": [["*",".","*"]]}, "expected": [["*","2","*"]]}]}',
ARRAY['matrix', 'simulation']),

-- 40
('e1000000-0000-0000-0000-000000000040', 'Mexican Wave', 'easy',
E'Simulate a Mexican Wave in a string.\n\nGiven a string, return an array of strings where each element is a copy of the input with one character uppercased, progressing left to right.\n\nOnly alphabetic characters trigger a wave (spaces are skipped but still occupy their position). The original string is all lowercase.\n\nFor example: `"hello"` produces `["Hello", "hEllo", "heLlo", "helLo", "hellO"]`.',
ARRAY['0 <= s.length <= 200', 's is lowercase letters and spaces only.'],
'{"javascript": "function mexicanWave(s) {\n  // your code here\n}", "python": "def mexican_wave(s):\n    pass"}',
'{"public": [{"input": {"s": "hello"}, "expected": ["Hello", "hEllo", "heLlo", "helLo", "hellO"]}, {"input": {"s": " ab "}, "expected": [" Ab ", " aB "]}], "hidden": [{"input": {"s": ""}, "expected": []}, {"input": {"s": "a"}, "expected": ["A"]}, {"input": {"s": "  "}, "expected": []}, {"input": {"s": "gap here"}, "expected": ["Gap here","gAp here","gaP here","gap Here","gap hEre","gap heRe","gap herE"]}]}',
ARRAY['strings', 'arrays']),

-- 41
('e1000000-0000-0000-0000-000000000041', 'Rotate Matrix 90 Degrees', 'easy',
E'Given an `n x n` 2D matrix, rotate it 90 degrees **clockwise** in-place and return the result.\n\nExample:\n```\n1 2 3      7 4 1\n4 5 6  ->  8 5 2\n7 8 9      9 6 3\n```',
ARRAY['1 <= n <= 100', 'matrix is n x n.'],
'{"javascript": "function rotateMatrix(matrix) {\n  // your code here\n}", "python": "def rotate_matrix(matrix):\n    pass"}',
'{"public": [{"input": {"matrix": [[1,2,3],[4,5,6],[7,8,9]]}, "expected": [[7,4,1],[8,5,2],[9,6,3]]}, {"input": {"matrix": [[1,2],[3,4]]}, "expected": [[3,1],[4,2]]}], "hidden": [{"input": {"matrix": [[1]]}, "expected": [[1]]}, {"input": {"matrix": [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]}, "expected": [[13,9,5,1],[14,10,6,2],[15,11,7,3],[16,12,8,4]]}]}',
ARRAY['matrix', 'arrays']),

-- 42
('e1000000-0000-0000-0000-000000000042', 'Verhoeff Check Digit', 'easy',
E'The Verhoeff algorithm is an error-detection algorithm that catches all single-digit errors and all transposition errors.\n\nGiven a string of digits, verify if it passes the Verhoeff checksum (the full number including the check digit).\n\nUse the standard Verhoeff tables:\n\nMultiplication table (d):\n```\n0123456789\n1234067895\n2340178956\n3401289567\n4012395678\n5987604321\n6598710432\n7659821043\n8765932104\n9876543210\n```\n\nPermutation table (p), apply row = position mod 8, starting from rightmost digit (pos 0):\n```\n0123456789\n1576283094\n5803714926\n8916043572\n9453126870\n4286573901\n2793806415\n7046913258\n```\n\nInverse table (inv): `0 4 3 2 1 5 6 7 8 9`\n\nProcess digits from right to left. The number is valid if the final checksum is 0.',
ARRAY['1 <= s.length <= 20', 's consists only of digits.'],
'{"javascript": "function verhoeffCheck(s) {\n  // your code here\n}", "python": "def verhoeff_check(s):\n    pass"}',
'{"public": [{"input": {"s": "2363"}, "expected": true}, {"input": {"s": "2364"}, "expected": false}], "hidden": [{"input": {"s": "758722"}, "expected": true}, {"input": {"s": "758723"}, "expected": false}, {"input": {"s": "0"}, "expected": true}, {"input": {"s": "123451"}, "expected": false}]}',
ARRAY['math', 'encoding']),

-- 43
('e1000000-0000-0000-0000-000000000043', 'Zeller Congruence Day', 'easy',
E'Given a date as `year`, `month`, and `day`, return the day of the week as a string (`"Sunday"`, `"Monday"`, ..., `"Saturday"`) using Zeller''s congruence.\n\nZeller''s formula (Gregorian calendar):\n```\nh = (q + floor(13*(m+1)/5) + K + floor(K/4) + floor(J/4) - 2*J) mod 7\n```\n\nWhere:\n- `q` = day of the month\n- `m` = month (3=March, 4=April, ..., 14=February). January and February are treated as months 13 and 14 of the **previous year**.\n- `K` = year % 100 (after adjustment for Jan/Feb)\n- `J` = floor(year / 100) (after adjustment)\n- `h` = day of week: 0=Saturday, 1=Sunday, 2=Monday, ..., 6=Friday\n\nHandle the modulo carefully for negative values.',
ARRAY['1 <= year <= 9999', '1 <= month <= 12', 'The date is valid.'],
'{"javascript": "function dayOfWeek(year, month, day) {\n  // your code here\n}", "python": "def day_of_week(year, month, day):\n    pass"}',
'{"public": [{"input": {"year": 2000, "month": 1, "day": 1}, "expected": "Saturday"}, {"input": {"year": 2023, "month": 12, "day": 25}, "expected": "Monday"}], "hidden": [{"input": {"year": 1900, "month": 1, "day": 1}, "expected": "Monday"}, {"input": {"year": 2024, "month": 2, "day": 29}, "expected": "Thursday"}, {"input": {"year": 1776, "month": 7, "day": 4}, "expected": "Thursday"}, {"input": {"year": 2026, "month": 4, "day": 13}, "expected": "Monday"}]}',
ARRAY['math']),

-- 44
('e1000000-0000-0000-0000-000000000044', 'Ulam Spiral Direction', 'easy',
E'In an Ulam spiral, positive integers are arranged in a counter-clockwise spiral starting from the center:\n\n```\n17 16 15 14 13\n18  5  4  3 12\n19  6  1  2 11\n20  7  8  9 10\n21 22 23 24 25\n```\n\nGiven a positive integer `n`, return its `(x, y)` coordinates where `1` is at `(0, 0)`, `2` is at `(1, 0)`, `3` is at `(1, 1)`, etc.\n\nPositive x is right, positive y is up.',
ARRAY['1 <= n <= 10^6'],
'{"javascript": "function ulamCoords(n) {\n  // your code here\n}", "python": "def ulam_coords(n):\n    pass"}',
'{"public": [{"input": {"n": 1}, "expected": [0, 0]}, {"input": {"n": 2}, "expected": [1, 0]}, {"input": {"n": 3}, "expected": [1, 1]}], "hidden": [{"input": {"n": 4}, "expected": [0, 1]}, {"input": {"n": 5}, "expected": [-1, 1]}, {"input": {"n": 6}, "expected": [-1, 0]}, {"input": {"n": 7}, "expected": [-1, -1]}, {"input": {"n": 10}, "expected": [2, -1]}, {"input": {"n": 25}, "expected": [2, -2]}]}',
ARRAY['math', 'simulation']),

-- 45
('e1000000-0000-0000-0000-000000000045', 'Unpack Nested Arrays', 'easy',
E'Given a string representing a nested array structure, parse it and return the fully flattened array of integers.\n\nThe input uses bracket notation: `"[1,[2,[3,4],5],6]"`.\n\nReturn all numbers in the order they appear, ignoring nesting.\n\nFor example: `"[1,[2,[3,4],5],6]"` -> `[1,2,3,4,5,6]`.\n\nNumbers may be negative.',
ARRAY['1 <= s.length <= 10^4', 'The input is a valid nested array of integers.'],
'{"javascript": "function flattenString(s) {\n  // your code here\n}", "python": "def flatten_string(s):\n    pass"}',
'{"public": [{"input": {"s": "[1,[2,[3,4],5],6]"}, "expected": [1,2,3,4,5,6]}, {"input": {"s": "[[1,2],[3,4]]"}, "expected": [1,2,3,4]}], "hidden": [{"input": {"s": "[1]"}, "expected": [1]}, {"input": {"s": "[[[[5]]]]"}, "expected": [5]}, {"input": {"s": "[-1,2,-3]"}, "expected": [-1,2,-3]}, {"input": {"s": "[1,[],2]"}, "expected": [1,2]}, {"input": {"s": "[]"}, "expected": []}]}',
ARRAY['strings', 'parsing', 'recursion']),

-- 46
('e1000000-0000-0000-0000-000000000046', 'Levenshtein Distance', 'easy',
E'The **Levenshtein distance** between two strings is the minimum number of single-character edits (insertions, deletions, or substitutions) required to change one word into the other.\n\nGiven two strings `a` and `b`, return their Levenshtein distance.',
ARRAY['0 <= a.length, b.length <= 100'],
'{"javascript": "function levenshtein(a, b) {\n  // your code here\n}", "python": "def levenshtein(a, b):\n    pass"}',
'{"public": [{"input": {"a": "kitten", "b": "sitting"}, "expected": 3}, {"input": {"a": "", "b": "abc"}, "expected": 3}], "hidden": [{"input": {"a": "abc", "b": "abc"}, "expected": 0}, {"input": {"a": "", "b": ""}, "expected": 0}, {"input": {"a": "a", "b": "b"}, "expected": 1}, {"input": {"a": "saturday", "b": "sunday"}, "expected": 3}, {"input": {"a": "intention", "b": "execution"}, "expected": 5}]}',
ARRAY['strings', 'dynamic-programming']),

-- 47
('e1000000-0000-0000-0000-000000000047', 'Longest Collatz Chain Under N', 'easy',
E'For each positive integer, the Collatz sequence is generated by:\n- If the number is even, divide by 2.\n- If odd, multiply by 3 and add 1.\n- Repeat until reaching 1.\n\nGiven a positive integer `n`, find which starting number **under** `n` (not including `n`) produces the longest Collatz chain.\n\nIf there is a tie, return the **largest** starting number.',
ARRAY['2 <= n <= 10^5'],
'{"javascript": "function longestCollatz(n) {\n  // your code here\n}", "python": "def longest_collatz(n):\n    pass"}',
'{"public": [{"input": {"n": 10}, "expected": 9}, {"input": {"n": 4}, "expected": 3}], "hidden": [{"input": {"n": 2}, "expected": 1}, {"input": {"n": 20}, "expected": 18}, {"input": {"n": 100}, "expected": 97}, {"input": {"n": 1000}, "expected": 871}]}',
ARRAY['math', 'simulation']),

-- 48
('e1000000-0000-0000-0000-000000000048', 'Clock Angle', 'easy',
E'Given a time in hours and minutes (12-hour format), return the **smaller** angle (in degrees) between the hour and minute hands of an analog clock.\n\nThe result should be a non-negative number less than or equal to 180.\n\nNote: The hour hand moves continuously (not just at hour marks). At 12:30, the hour hand is halfway between 12 and 1.',
ARRAY['1 <= h <= 12', '0 <= m <= 59'],
'{"javascript": "function clockAngle(h, m) {\n  // your code here\n}", "python": "def clock_angle(h, m):\n    pass"}',
'{"public": [{"input": {"h": 3, "m": 0}, "expected": 90}, {"input": {"h": 12, "m": 30}, "expected": 165}], "hidden": [{"input": {"h": 6, "m": 0}, "expected": 180}, {"input": {"h": 12, "m": 0}, "expected": 0}, {"input": {"h": 1, "m": 0}, "expected": 30}, {"input": {"h": 9, "m": 0}, "expected": 90}, {"input": {"h": 3, "m": 15}, "expected": 7.5}, {"input": {"h": 12, "m": 1}, "expected": 5.5}]}',
ARRAY['math']),

-- 49
('e1000000-0000-0000-0000-000000000049', 'Valid Sudoku Row/Col/Box', 'easy',
E'Determine if a 9x9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:\n\n1. Each row must contain the digits 1-9 without repetition.\n2. Each column must contain the digits 1-9 without repetition.\n3. Each of the nine 3x3 sub-boxes must contain the digits 1-9 without repetition.\n\nEmpty cells are represented as `0`. A board can be partially filled and still be valid.\n\nReturn `true` if the board is valid, `false` otherwise.',
ARRAY['board.length == 9', 'board[i].length == 9', '0 <= board[i][j] <= 9'],
'{"javascript": "function isValidSudoku(board) {\n  // your code here\n}", "python": "def is_valid_sudoku(board):\n    pass"}',
'{"public": [{"input": {"board": [[5,3,0,0,7,0,0,0,0],[6,0,0,1,9,5,0,0,0],[0,9,8,0,0,0,0,6,0],[8,0,0,0,6,0,0,0,3],[4,0,0,8,0,3,0,0,1],[7,0,0,0,2,0,0,0,6],[0,6,0,0,0,0,2,8,0],[0,0,0,4,1,9,0,0,5],[0,0,0,0,8,0,0,7,9]]}, "expected": true}, {"input": {"board": [[5,3,0,0,7,0,0,0,0],[6,0,0,1,9,5,0,0,0],[0,9,8,0,0,0,0,6,0],[8,0,0,0,6,0,0,0,3],[4,0,0,8,0,3,0,0,1],[7,0,0,0,2,0,0,0,6],[0,6,0,0,0,0,2,8,0],[0,0,0,4,1,9,0,0,5],[0,0,0,0,8,0,0,7,5]]}, "expected": false}], "hidden": [{"input": {"board": [[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0]]}, "expected": true}, {"input": {"board": [[1,0,0,0,0,0,0,0,1],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0]]}, "expected": false}]}',
ARRAY['matrix', 'hash-map']),

-- 50
('e1000000-0000-0000-0000-000000000050', 'Continued Fraction', 'easy',
E'A simple continued fraction represents a rational number as:\n```\na0 + 1/(a1 + 1/(a2 + 1/(a3 + ...)))\n```\n\nGiven an array of coefficients `[a0, a1, a2, ...]`, compute the value as a fraction and return it as a two-element array `[numerator, denominator]` in lowest terms.\n\nFor example: `[1, 2, 3]` represents `1 + 1/(2 + 1/3) = 1 + 1/(7/3) = 1 + 3/7 = 10/7`, so return `[10, 7]`.',
ARRAY['1 <= coefficients.length <= 20', '0 <= coefficients[i] <= 100', 'coefficients[i] >= 1 for i > 0'],
'{"javascript": "function continuedFraction(coefficients) {\n  // your code here\n}", "python": "def continued_fraction(coefficients):\n    pass"}',
'{"public": [{"input": {"coefficients": [1, 2, 3]}, "expected": [10, 7]}, {"input": {"coefficients": [3]}, "expected": [3, 1]}], "hidden": [{"input": {"coefficients": [0, 1]}, "expected": [1, 1]}, {"input": {"coefficients": [1, 1, 1, 1, 1]}, "expected": [8, 5]}, {"input": {"coefficients": [3, 7, 15, 1]}, "expected": [355, 113]}, {"input": {"coefficients": [2, 1, 2, 1, 1, 4, 1, 1, 6]}, "expected": [1264, 465]}, {"input": {"coefficients": [4, 2, 6, 7]}, "expected": [415, 97]}]}',
ARRAY['math', 'recursion']);


-- ===================== EXAMPLES =====================

INSERT INTO examples (challenge_id, input, output, explanation) VALUES

-- Off-by-One Calendar
('e1000000-0000-0000-0000-000000000001', 'month = 2, year = 2020', '29', '2020 is divisible by 4 and not a century, so it is a leap year.'),
('e1000000-0000-0000-0000-000000000001', 'month = 2, year = 1900', '28', '1900 is divisible by 100 but not 400, so it is NOT a leap year.'),
('e1000000-0000-0000-0000-000000000001', 'month = 4, year = 2023', '30', 'April always has 30 days.'),

-- Staircase Typo Detector
('e1000000-0000-0000-0000-000000000002', 's = "jr;;p"', '"hello"', 'Each character is shifted one key to the left on a QWERTY keyboard: j->h, r->e, ;->l, ;->l, p->o.'),
('e1000000-0000-0000-0000-000000000002', 's = "vpfsmr"', '"codear"', NULL),

-- Balanced Ternary
('e1000000-0000-0000-0000-000000000003', 's = "1T0"', '6', '1*9 + (-1)*3 + 0*1 = 6.'),
('e1000000-0000-0000-0000-000000000003', 's = "T"', '-1', 'T represents -1.'),
('e1000000-0000-0000-0000-000000000003', 's = "111"', '13', '1*9 + 1*3 + 1*1 = 13.'),

-- Resistor Color Code
('e1000000-0000-0000-0000-000000000004', 'bands = ["brown", "black", "red"]', '1000', 'Brown=1, black=0 gives 10, red=2 means 2 zeros, so 10 * 100 = 1000 ohms.'),
('e1000000-0000-0000-0000-000000000004', 'bands = ["yellow", "violet", "orange"]', '47000', 'Yellow=4, violet=7 gives 47, orange=3 means 3 zeros, so 47000 ohms.'),

-- Semantic Version Compare
('e1000000-0000-0000-0000-000000000005', 'v1 = "1.2.3", v2 = "1.2.4"', '-1', 'Patch 3 < 4, so v2 is greater.'),
('e1000000-0000-0000-0000-000000000005', 'v1 = "2.0.0", v2 = "1.9.9"', '1', 'Major 2 > 1, so v1 is greater regardless of minor/patch.'),
('e1000000-0000-0000-0000-000000000005', 'v1 = "1.01.0", v2 = "1.1.0"', '0', 'Leading zeros are treated numerically: 01 equals 1.'),

-- Run-Length Decoding
('e1000000-0000-0000-0000-000000000006', 's = "3a2b"', '"aaabb"', '3 copies of a followed by 2 copies of b.'),
('e1000000-0000-0000-0000-000000000006', 's = "12a"', '"aaaaaaaaaaaa"', 'Multi-digit count: 12 copies of a.'),

-- Look-and-Say Sequence
('e1000000-0000-0000-0000-000000000007', 'n = 1', '"1"', 'The first term is "1".'),
('e1000000-0000-0000-0000-000000000007', 'n = 4', '"1211"', '"21" is read as one 2 and one 1, giving "1211".'),
('e1000000-0000-0000-0000-000000000007', 'n = 5', '"111221"', '"1211" is read as one 1, one 2, two 1s, giving "111221".'),

-- Luhn Check
('e1000000-0000-0000-0000-000000000008', 's = "79927398713"', 'true', 'The weighted sum is 70, which is divisible by 10.'),
('e1000000-0000-0000-0000-000000000008', 's = "79927398710"', 'false', 'The weighted sum is not divisible by 10.'),
('e1000000-0000-0000-0000-000000000008', 's = "0"', 'false', 'Strings with fewer than 2 digits are invalid.'),

-- Caesar Cipher with Wraparound
('e1000000-0000-0000-0000-000000000009', 's = "abc", k = 3', '"def"', 'Each letter shifted 3 positions forward.'),
('e1000000-0000-0000-0000-000000000009', 's = "Hello, World!", k = 13', '"Uryyb, Jbeyq!"', 'ROT13 cipher. Non-letter characters unchanged. Case preserved.'),
('e1000000-0000-0000-0000-000000000009', 's = "xyz", k = 3', '"abc"', 'Wraps around: x->a, y->b, z->c.'),

-- Digital Root
('e1000000-0000-0000-0000-000000000010', 'n = 493', '7', '4+9+3 = 16, then 1+6 = 7.'),
('e1000000-0000-0000-0000-000000000010', 'n = 0', '0', 'The digital root of 0 is 0.'),

-- Gray Code Neighbor Check
('e1000000-0000-0000-0000-000000000011', 'a = 5, b = 7', 'true', '5 = 101, 7 = 111. They differ in exactly one bit (the middle bit).'),
('e1000000-0000-0000-0000-000000000011', 'a = 5, b = 6', 'false', '5 = 101, 6 = 110. They differ in two bits.'),

-- Morse Code Decoder
('e1000000-0000-0000-0000-000000000012', 's = ".... . .-.. .-.. ---"', '"HELLO"', 'Each letter is separated by a single space.'),
('e1000000-0000-0000-0000-000000000012', 's = ".... ..   - .... . .-. ."', '"HI THERE"', 'Three spaces separate words.'),

-- Complement Base Pairs
('e1000000-0000-0000-0000-000000000013', 's = "AGTC"', '"GACT"', 'Complement: TCAG, then reverse: GACT.'),
('e1000000-0000-0000-0000-000000000013', 's = "AAAA"', '"TTTT"', 'Complement: TTTT, reversed is still TTTT.'),

-- Zigzag Array
('e1000000-0000-0000-0000-000000000014', 'arr = [4, 3, 7, 8, 6, 2, 1]', 'A valid zigzag rearrangement', 'For example [3, 7, 4, 8, 2, 6, 1] satisfies a[0] < a[1] > a[2] < a[3] > a[4] < a[5] > a[6].'),
('e1000000-0000-0000-0000-000000000014', 'arr = [1, 2, 3]', 'A valid zigzag rearrangement', 'For example [1, 3, 2] satisfies 1 < 3 > 2.'),

-- Excel Column Name
('e1000000-0000-0000-0000-000000000015', 'n = 1', '"A"', 'The first column is A.'),
('e1000000-0000-0000-0000-000000000015', 'n = 28', '"AB"', '26 = Z, 27 = AA, 28 = AB.'),
('e1000000-0000-0000-0000-000000000015', 'n = 702', '"ZZ"', NULL),

-- Validate IPv4
('e1000000-0000-0000-0000-000000000016', 's = "192.168.1.1"', 'true', 'All octets are valid numbers between 0 and 255.'),
('e1000000-0000-0000-0000-000000000016', 's = "256.1.1.1"', 'false', '256 exceeds the maximum value of 255.'),
('e1000000-0000-0000-0000-000000000016', 's = "01.0.0.0"', 'false', 'Leading zeros are not allowed.'),

-- Collatz Steps
('e1000000-0000-0000-0000-000000000017', 'n = 6', '8', '6 -> 3 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1 (8 steps).'),
('e1000000-0000-0000-0000-000000000017', 'n = 1', '0', 'Already at 1, no steps needed.'),

-- Pangram Checker
('e1000000-0000-0000-0000-000000000018', 's = "The quick brown fox jumps over the lazy dog"', '[]', 'This sentence contains every letter of the alphabet.'),
('e1000000-0000-0000-0000-000000000018', 's = "hello"', '["a","b","c","d","f","g","i","j","k","m","n","p","q","r","s","t","u","v","w","x","y","z"]', 'Only h, e, l, o are present.'),

-- Bit Counting Staircase
('e1000000-0000-0000-0000-000000000019', 'n = 5', '[0,1,1,2,1,2]', 'Binary: 0,1,10,11,100,101 have 0,1,1,2,1,2 ones respectively.'),
('e1000000-0000-0000-0000-000000000019', 'n = 0', '[0]', 'Only 0 in range, which has 0 set bits.'),

-- Tower of Hanoi Moves
('e1000000-0000-0000-0000-000000000020', 'n = 1', '["A->C"]', 'Move the single disk directly from A to C.'),
('e1000000-0000-0000-0000-000000000020', 'n = 2', '["A->B", "A->C", "B->C"]', 'Move top disk to B, bottom disk to C, then top disk from B to C.'),

-- Roman Numeral Encoder
('e1000000-0000-0000-0000-000000000021', 'num = 1994', '"MCMXCIV"', 'M=1000, CM=900, XC=90, IV=4.'),
('e1000000-0000-0000-0000-000000000021', 'num = 58', '"LVIII"', 'L=50, V=5, III=3.'),

-- Transpose Musical Pitch
('e1000000-0000-0000-0000-000000000022', 'note = "C", semitones = 4', '"E"', 'C -> C# -> D -> D# -> E (4 semitones up).'),
('e1000000-0000-0000-0000-000000000022', 'note = "A", semitones = 3', '"C"', 'A -> A# -> B -> C (3 semitones up).'),
('e1000000-0000-0000-0000-000000000022', 'note = "C", semitones = -1', '"B"', 'Going one semitone down from C wraps to B.'),

-- Scrabble Score
('e1000000-0000-0000-0000-000000000023', 'word = "QUIZ"', '22', 'Q=10, U=1, I=1, Z=10. Total = 22.'),
('e1000000-0000-0000-0000-000000000023', 'word = "hello"', '8', 'h=4, e=1, l=1, l=1, o=1. Total = 8.'),

-- Spiral Order First Ring
('e1000000-0000-0000-0000-000000000024', 'matrix = [[1,2,3],[4,5,6],[7,8,9]]', '[1,2,3,6,9,8,7,4]', 'Traverse the border clockwise: top row, right column, bottom row reversed, left column reversed.'),
('e1000000-0000-0000-0000-000000000024', 'matrix = [[1]]', '[1]', 'A single element is its own border.'),

-- Braille Encoder
('e1000000-0000-0000-0000-000000000025', 's = "a"', '"100000"', 'Only dot 1 is raised for letter a.'),
('e1000000-0000-0000-0000-000000000025', 's = "b"', '"110000"', 'Dots 1 and 2 are raised for letter b.'),

-- NATO Phonetic Alphabet
('e1000000-0000-0000-0000-000000000026', 's = "SOS"', '"Sierra Oscar Sierra"', 'Each letter maps to its NATO code word.'),
('e1000000-0000-0000-0000-000000000026', 's = "Hi!"', '"Hotel India !"', 'Non-letter characters are kept as-is.'),

-- ISBN-10 Validator
('e1000000-0000-0000-0000-000000000027', 's = "0306406152"', 'true', 'Weighted sum: 0*10+3*9+0*8+6*7+4*6+0*5+6*4+1*3+5*2+2*1 = 132, which is divisible by 11.'),
('e1000000-0000-0000-0000-000000000027', 's = "0306406153"', 'false', 'The checksum is not divisible by 11.'),

-- Duplicate Encoder
('e1000000-0000-0000-0000-000000000028', 's = "recede"', '"()()()"', 'r and d appear once -> (, e and c appear multiple times -> ).'),
('e1000000-0000-0000-0000-000000000028', 's = "Success"', '")())())"', 'Case-insensitive: S/s appears 3 times, c appears 2 times.'),

-- Reverse Polish Notation
('e1000000-0000-0000-0000-000000000029', 'tokens = ["2", "1", "+", "3", "*"]', '9', '(2 + 1) * 3 = 9.'),
('e1000000-0000-0000-0000-000000000029', 'tokens = ["4", "13", "5", "/", "+"]', '6', '4 + (13 / 5) = 4 + 2 = 6. Division truncates toward zero.'),

-- Abundant, Deficient, or Perfect
('e1000000-0000-0000-0000-000000000030', 'n = 6', '"perfect"', 'Proper divisors: 1, 2, 3. Sum = 6 = n.'),
('e1000000-0000-0000-0000-000000000030', 'n = 12', '"abundant"', 'Proper divisors: 1, 2, 3, 4, 6. Sum = 16 > 12.'),
('e1000000-0000-0000-0000-000000000030', 'n = 8', '"deficient"', 'Proper divisors: 1, 2, 4. Sum = 7 < 8.'),

-- Kaprekar Routine Steps
('e1000000-0000-0000-0000-000000000031', 'n = 3524', '3', '5432 - 2345 = 3087 -> 8730 - 0378 = 8352 -> 8532 - 2358 = 6174. Three steps.'),
('e1000000-0000-0000-0000-000000000031', 'n = 6174', '0', 'Already at the Kaprekar constant.'),

-- Conway Game of Life Step
('e1000000-0000-0000-0000-000000000032', 'grid = [[0,1,0],[0,0,1],[1,1,1],[0,0,0]]', '[[0,0,0],[1,0,1],[0,1,1],[0,1,0]]', 'Apply birth/survival rules simultaneously to all cells.'),
('e1000000-0000-0000-0000-000000000032', 'grid = [[1,1],[1,1]]', '[[1,1],[1,1]]', 'A 2x2 block is a stable still life pattern.'),

-- Pig Latin Translator
('e1000000-0000-0000-0000-000000000033', 's = "hello world"', '"ellohay orldway"', 'h is a consonant -> move to end + "ay". w is a consonant -> move to end + "ay".'),
('e1000000-0000-0000-0000-000000000033', 's = "apple"', '"appleway"', 'Starts with a vowel -> append "way".'),
('e1000000-0000-0000-0000-000000000033', 's = "quick brown fox"', '"ickquay ownbray oxfay"', 'Move all leading consonants: qu from quick, br from brown, f from fox.'),

-- Soundex Code
('e1000000-0000-0000-0000-000000000034', 's = "Robert"', '"R163"', 'R is kept, o is dropped, b=1, e dropped, r=6, t=3.'),
('e1000000-0000-0000-0000-000000000034', 's = "Ashcraft"', '"A261"', 's=2, h dropped, c=2 (adjacent duplicate with s, so dropped), r=6, a dropped, f=1, t=3 -> truncated to A261.'),

-- Sieve of Sundaram
('e1000000-0000-0000-0000-000000000035', 'n = 10', '[2,3,5,7]', 'All primes up to 10.'),
('e1000000-0000-0000-0000-000000000035', 'n = 1', '[]', 'No primes less than or equal to 1.'),

-- Persistent Number
('e1000000-0000-0000-0000-000000000036', 'n = 39', '3', '3*9=27, 2*7=14, 1*4=4. Three multiplications to reach a single digit.'),
('e1000000-0000-0000-0000-000000000036', 'n = 999', '4', '9*9*9=729, 7*2*9=126, 1*2*6=12, 1*2=2. Four steps.'),
('e1000000-0000-0000-0000-000000000036', 'n = 4', '0', 'Already a single digit.'),

-- Rainwater in a Histogram
('e1000000-0000-0000-0000-000000000037', 'height = [0,1,0,2,1,0,1,3,2,1,2,1]', '6', 'Water fills the gaps between the bars, totaling 6 units.'),
('e1000000-0000-0000-0000-000000000037', 'height = [4,2,0,3,2,5]', '9', NULL),

-- Bijective Base-26 Decode
('e1000000-0000-0000-0000-000000000038', 's = "A"', '1', 'A is the first column.'),
('e1000000-0000-0000-0000-000000000038', 's = "AB"', '28', 'A=1 * 26 + B=2 = 28.'),
('e1000000-0000-0000-0000-000000000038', 's = "ZZ"', '702', '26*26 + 26 = 702.'),

-- Minesweeper Board
('e1000000-0000-0000-0000-000000000039', 'grid = [["*",".","."],[".",".","."],[".","*","."]]', '[["*","1","0"],["2","2","1"],["1","*","1"]]', 'Each empty cell shows how many of its 8 neighbors are mines.'),
('e1000000-0000-0000-0000-000000000039', 'grid = [["."]]', '[["0"]]', 'No mines anywhere, so the count is 0.'),

-- Mexican Wave
('e1000000-0000-0000-0000-000000000040', 's = "hello"', '["Hello", "hEllo", "heLlo", "helLo", "hellO"]', 'Each element has one letter uppercased, progressing left to right.'),
('e1000000-0000-0000-0000-000000000040', 's = " ab "', '[" Ab ", " aB "]', 'Spaces are skipped but preserved in each element.'),

-- Rotate Matrix 90 Degrees
('e1000000-0000-0000-0000-000000000041', 'matrix = [[1,2,3],[4,5,6],[7,8,9]]', '[[7,4,1],[8,5,2],[9,6,3]]', 'Each column becomes a row in reverse order.'),
('e1000000-0000-0000-0000-000000000041', 'matrix = [[1,2],[3,4]]', '[[3,1],[4,2]]', NULL),

-- Verhoeff Check Digit
('e1000000-0000-0000-0000-000000000042', 's = "2363"', 'true', 'Processing right to left through the Verhoeff tables yields checksum 0.'),
('e1000000-0000-0000-0000-000000000042', 's = "2364"', 'false', 'The checksum is not 0.'),

-- Zeller Congruence Day
('e1000000-0000-0000-0000-000000000043', 'year = 2000, month = 1, day = 1', '"Saturday"', 'January 1, 2000 was a Saturday.'),
('e1000000-0000-0000-0000-000000000043', 'year = 2023, month = 12, day = 25', '"Monday"', 'Christmas 2023 fell on a Monday.'),

-- Ulam Spiral Direction
('e1000000-0000-0000-0000-000000000044', 'n = 1', '[0, 0]', 'The center of the spiral.'),
('e1000000-0000-0000-0000-000000000044', 'n = 3', '[1, 1]', 'Starting from 1 at origin, 2 is right, 3 is up.'),
('e1000000-0000-0000-0000-000000000044', 'n = 10', '[2, -1]', NULL),

-- Unpack Nested Arrays
('e1000000-0000-0000-0000-000000000045', 's = "[1,[2,[3,4],5],6]"', '[1,2,3,4,5,6]', 'All integers extracted in order, ignoring bracket nesting.'),
('e1000000-0000-0000-0000-000000000045', 's = "[[[[5]]]]"', '[5]', 'Deeply nested single element.'),

-- Levenshtein Distance
('e1000000-0000-0000-0000-000000000046', 'a = "kitten", b = "sitting"', '3', 'kitten -> sitten (sub s) -> sittin (sub i) -> sitting (insert g).'),
('e1000000-0000-0000-0000-000000000046', 'a = "", b = "abc"', '3', 'Three insertions needed.'),

-- Longest Collatz Chain Under N
('e1000000-0000-0000-0000-000000000047', 'n = 10', '9', 'Starting number 9 produces the longest chain among 1-9.'),
('e1000000-0000-0000-0000-000000000047', 'n = 4', '3', 'Chain for 3: 3->10->5->16->8->4->2->1 (7 steps), longest under 4.'),

-- Clock Angle
('e1000000-0000-0000-0000-000000000048', 'h = 3, m = 0', '90', 'The hour hand is at 90 degrees, the minute hand is at 0.'),
('e1000000-0000-0000-0000-000000000048', 'h = 12, m = 30', '165', 'Minute hand at 180 degrees, hour hand at 15 degrees (halfway between 12 and 1). Angle = 165.'),

-- Valid Sudoku Row/Col/Box
('e1000000-0000-0000-0000-000000000049', 'board = [[5,3,0,...],[6,0,0,...],...]', 'true', 'The partially filled board has no duplicate digits in any row, column, or 3x3 box.'),
('e1000000-0000-0000-0000-000000000049', 'board (with duplicate 5 in last column)', 'false', 'Column 9 contains two 5s, violating Sudoku rules.'),

-- Continued Fraction
('e1000000-0000-0000-0000-000000000050', 'coefficients = [1, 2, 3]', '[10, 7]', '1 + 1/(2 + 1/3) = 1 + 1/(7/3) = 1 + 3/7 = 10/7.'),
('e1000000-0000-0000-0000-000000000050', 'coefficients = [3, 7, 15, 1]', '[355, 113]', 'This is the famous approximation of pi: 355/113 = 3.1415929...');
