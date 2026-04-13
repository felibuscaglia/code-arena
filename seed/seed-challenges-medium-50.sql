-- 50 Unique Medium Challenges for CodePVP
-- Designed to be rare on other platforms and tricky for LLMs to solve correctly.

INSERT INTO challenges (id, title, difficulty, description, constraints, starter_code, test_cases, tags) VALUES

-- 1
('b1000000-0000-0000-0000-000000000001', 'Shunting Yard Parser', 'medium',
E'Implement the Shunting Yard algorithm to convert an infix mathematical expression into Reverse Polish Notation (postfix).\n\nThe expression contains:\n- Non-negative integers (single or multi-digit)\n- Operators: `+`, `-`, `*`, `/`, `^` (exponentiation)\n- Parentheses: `(`, `)`\n\nOperator precedence (highest to lowest): `^`, then `*` and `/`, then `+` and `-`.\n\n`^` is **right-associative**. All other operators are **left-associative**.\n\nReturn the postfix expression as an array of strings (numbers and operators).',
ARRAY['1 <= expression.length <= 200', 'The expression is always valid.', 'No unary operators.'],
'{"javascript": "function shuntingYard(expression) {\n  // your code here\n}", "python": "def shunting_yard(expression):\n    pass"}',
'{"public": [{"input": {"expression": "3 + 4 * 2"}, "expected": ["3", "4", "2", "*", "+"]}, {"input": {"expression": "( 1 + 2 ) * 3"}, "expected": ["1", "2", "+", "3", "*"]}], "hidden": [{"input": {"expression": "2 ^ 3 ^ 2"}, "expected": ["2", "3", "2", "^", "^"]}, {"input": {"expression": "3 + 4 * 2 / ( 1 - 5 ) ^ 2 ^ 3"}, "expected": ["3", "4", "2", "*", "1", "5", "-", "2", "3", "^", "^", "/", "+"]}, {"input": {"expression": "10 + 20"}, "expected": ["10", "20", "+"]}, {"input": {"expression": "( ( 1 + 2 ) )"}, "expected": ["1", "2", "+"]}]}',
ARRAY['stack', 'parsing', 'math']),

-- 2
('b1000000-0000-0000-0000-000000000002', 'Cron Expression Next Fire', 'medium',
E'Given a simplified cron expression and a current datetime, return the next time the cron will fire.\n\nThe cron format is: `minute hour day_of_month month day_of_week`\n\nEach field can be:\n- `*` (any value)\n- A single number\n- A comma-separated list of numbers\n\nRanges:\n- minute: 0-59\n- hour: 0-23\n- day_of_month: 1-31\n- month: 1-12\n- day_of_week: 0-6 (0 = Sunday)\n\nReturn the next fire time as a string in `"YYYY-MM-DD HH:MM"` format. The next fire time must be **strictly after** the current time.\n\nIf both day_of_month and day_of_week are specified (not `*`), the cron fires when **either** matches (union).',
ARRAY['The current datetime is a valid date string in "YYYY-MM-DD HH:MM" format.', 'A valid next fire time always exists within the next 4 years.'],
'{"javascript": "function nextCronFire(cron, current) {\n  // your code here\n}", "python": "def next_cron_fire(cron, current):\n    pass"}',
'{"public": [{"input": {"cron": "30 8 * * *", "current": "2024-01-15 08:00"}, "expected": "2024-01-15 08:30"}, {"input": {"cron": "0 0 1 * *", "current": "2024-01-01 00:00"}, "expected": "2024-02-01 00:00"}], "hidden": [{"input": {"cron": "0 12 * * 1", "current": "2024-01-15 12:00"}, "expected": "2024-01-22 12:00"}, {"input": {"cron": "59 23 31 12 *", "current": "2024-12-31 23:59"}, "expected": "2025-12-31 23:59"}, {"input": {"cron": "0,30 * * * *", "current": "2024-06-15 14:29"}, "expected": "2024-06-15 14:30"}]}',
ARRAY['simulation', 'parsing', 'math']),

-- 3
('b1000000-0000-0000-0000-000000000003', 'Huffman Encoding Table', 'medium',
E'Given a string, build a Huffman encoding table.\n\n1. Count the frequency of each character.\n2. Build a Huffman tree using a min-heap (priority queue). When two nodes have the same frequency, the node whose character (or whose leftmost leaf character) has a **smaller ASCII value** should be dequeued first.\n3. Assign `0` to left branches and `1` to right branches.\n\nReturn an object/dictionary mapping each character to its Huffman code string.\n\nIf the string has only one unique character, its code should be `"0"`.',
ARRAY['1 <= s.length <= 10^4', 's consists of printable ASCII characters.'],
'{"javascript": "function huffmanTable(s) {\n  // your code here\n}", "python": "def huffman_table(s):\n    pass"}',
'{"public": [{"input": {"s": "aabbc"}, "expected": {"a": "00", "b": "01", "c": "1"}}, {"input": {"s": "aaaa"}, "expected": {"a": "0"}}], "hidden": [{"input": {"s": "abcdef"}, "expected": {"a": "000", "b": "001", "c": "100", "d": "101", "e": "01", "f": "11"}}, {"input": {"s": "ab"}, "expected": {"a": "0", "b": "1"}}, {"input": {"s": "aaabbc"}, "expected": {"a": "0", "b": "10", "c": "11"}}]}',
ARRAY['trees', 'heap', 'greedy', 'encoding']),

-- 4
('b1000000-0000-0000-0000-000000000004', 'Evaluate Boolean Expression Tree', 'medium',
E'Given a boolean expression as a string, evaluate it and return the result.\n\nThe expression uses prefix notation with these operators:\n- `&(expr1,expr2,...)` - AND of all sub-expressions\n- `|(expr1,expr2,...)` - OR of all sub-expressions\n- `!(expr)` - NOT (always exactly one operand)\n- `t` - true\n- `f` - false\n\nExpressions can be nested arbitrarily.\n\nReturn `true` or `false`.',
ARRAY['1 <= expression.length <= 2 * 10^4', 'The expression is always valid.'],
'{"javascript": "function evalBoolExpr(expression) {\n  // your code here\n}", "python": "def eval_bool_expr(expression):\n    pass"}',
'{"public": [{"input": {"expression": "&(t,t,t)"}, "expected": true}, {"input": {"expression": "|(f,f,t)"}, "expected": true}, {"input": {"expression": "!(t)"}, "expected": false}], "hidden": [{"input": {"expression": "t"}, "expected": true}, {"input": {"expression": "&(t,|(f,t))"}, "expected": true}, {"input": {"expression": "!(&(f,t))"}, "expected": true}, {"input": {"expression": "&(t,t,!(|(f,f,f)))"}, "expected": true}, {"input": {"expression": "|(f,&(t,!(t)))"}, "expected": false}]}',
ARRAY['stack', 'recursion', 'parsing']),

-- 5
('b1000000-0000-0000-0000-000000000005', 'Topological Sort with Lexicographic Order', 'medium',
E'Given `n` nodes labeled `0` to `n-1` and a list of directed edges `[from, to]`, return a topological ordering of the nodes.\n\nIf multiple valid orderings exist, return the **lexicographically smallest** one.\n\nIf the graph has a cycle (no valid ordering exists), return an empty array.',
ARRAY['1 <= n <= 10^4', '0 <= edges.length <= 10^4', 'edges[i].length == 2', '0 <= edges[i][0], edges[i][1] < n'],
'{"javascript": "function topoSort(n, edges) {\n  // your code here\n}", "python": "def topo_sort(n, edges):\n    pass"}',
'{"public": [{"input": {"n": 4, "edges": [[1,0],[2,0],[3,1],[3,2]]}, "expected": [0,1,2,3]}, {"input": {"n": 2, "edges": [[0,1],[1,0]]}, "expected": []}], "hidden": [{"input": {"n": 3, "edges": []}, "expected": [0,1,2]}, {"input": {"n": 6, "edges": [[5,2],[5,0],[4,0],[4,1],[2,3],[3,1]]}, "expected": [0,1,2,3,4,5]}, {"input": {"n": 1, "edges": []}, "expected": [0]}]}',
ARRAY['graphs', 'topological-sort', 'heap']),

-- 6
('b1000000-0000-0000-0000-000000000006', 'Regex Pattern Matcher (Subset)', 'medium',
E'Implement a simplified regex matcher supporting:\n- `.` matches any single character\n- `*` matches zero or more of the **preceding** character\n- `+` matches one or more of the **preceding** character\n- `?` matches zero or one of the **preceding** character\n- All other characters match themselves literally\n\nThe pattern must match the **entire** input string.\n\nReturn `true` if the string matches, `false` otherwise.',
ARRAY['0 <= s.length <= 100', '0 <= p.length <= 100', 'p does not start with * + or ?', 'Quantifiers (* + ?) never follow another quantifier.'],
'{"javascript": "function regexMatch(s, p) {\n  // your code here\n}", "python": "def regex_match(s, p):\n    pass"}',
'{"public": [{"input": {"s": "aab", "p": "a*b"}, "expected": true}, {"input": {"s": "abc", "p": "a.c"}, "expected": true}], "hidden": [{"input": {"s": "", "p": "a*"}, "expected": true}, {"input": {"s": "abc", "p": "a+bc"}, "expected": true}, {"input": {"s": "bc", "p": "a+bc"}, "expected": false}, {"input": {"s": "ac", "p": "ab?c"}, "expected": true}, {"input": {"s": "abc", "p": "ab?c"}, "expected": true}, {"input": {"s": "abbc", "p": "ab?c"}, "expected": false}, {"input": {"s": "", "p": ""}, "expected": true}, {"input": {"s": "aaa", "p": "a*a*a*"}, "expected": true}]}',
ARRAY['strings', 'dynamic-programming', 'recursion']),

-- 7
('b1000000-0000-0000-0000-000000000007', 'Matrix Chain Multiplication Order', 'medium',
E'Given an array `dims` where `dims[i-1] x dims[i]` gives the dimensions of the `i`th matrix, find the minimum number of scalar multiplications needed to compute the product of all matrices.\n\nFor example, given matrices A (10x30), B (30x5), C (5x60), dims = [10, 30, 5, 60].\n- (AB)C = 10*30*5 + 10*5*60 = 1500 + 3000 = 4500\n- A(BC) = 30*5*60 + 10*30*60 = 9000 + 18000 = 27000\n\nMinimum is 4500.\n\nReturn the minimum number of multiplications.',
ARRAY['2 <= dims.length <= 100', '1 <= dims[i] <= 500'],
'{"javascript": "function matrixChainOrder(dims) {\n  // your code here\n}", "python": "def matrix_chain_order(dims):\n    pass"}',
'{"public": [{"input": {"dims": [10, 30, 5, 60]}, "expected": 4500}, {"input": {"dims": [40, 20, 30, 10, 30]}, "expected": 26000}], "hidden": [{"input": {"dims": [10, 20]}, "expected": 0}, {"input": {"dims": [10, 20, 30]}, "expected": 6000}, {"input": {"dims": [1, 2, 3, 4, 5]}, "expected": 38}, {"input": {"dims": [5, 10, 3, 12, 5, 50, 6]}, "expected": 2010}]}',
ARRAY['dynamic-programming', 'math']),

-- 8
('b1000000-0000-0000-0000-000000000008', 'Langton''s Ant Simulation', 'medium',
E'Langton''s Ant is a two-dimensional Turing machine with simple rules:\n\n1. At a **white** cell: turn 90 degrees **clockwise**, flip the cell to black, move forward one step.\n2. At a **black** cell: turn 90 degrees **counter-clockwise**, flip the cell to white, move forward one step.\n\nThe grid is infinite and starts all white. The ant starts at `(0, 0)` facing **up** (north).\n\nGiven a number of steps `n`, return an object with:\n- `position`: the ant''s final `[x, y]` coordinates\n- `blackCells`: the total number of black cells on the grid\n\nPositive x is right, positive y is up.',
ARRAY['0 <= n <= 15000'],
'{"javascript": "function langtonsAnt(n) {\n  // your code here\n}", "python": "def langtons_ant(n):\n    pass"}',
'{"public": [{"input": {"n": 0}, "expected": {"position": [0, 0], "blackCells": 0}}, {"input": {"n": 1}, "expected": {"position": [1, 0], "blackCells": 1}}], "hidden": [{"input": {"n": 2}, "expected": {"position": [1, -1], "blackCells": 2}}, {"input": {"n": 4}, "expected": {"position": [0, 0], "blackCells": 4}}, {"input": {"n": 10}, "expected": {"position": [0, -1], "blackCells": 4}}, {"input": {"n": 104}, "expected": {"position": [0, -1], "blackCells": 12}}]}',
ARRAY['simulation', 'hash-map']),

-- 9
('b1000000-0000-0000-0000-000000000009', 'Interval Merge and Gap Detection', 'medium',
E'Given a list of intervals `[start, end]` and a new interval, do the following:\n\n1. Insert the new interval into the list, merging any overlapping intervals.\n2. Return an object containing:\n   - `merged`: the resulting list of non-overlapping intervals, sorted by start time\n   - `gaps`: a list of gaps (unoccupied intervals) between the merged intervals\n\nIntervals are inclusive on both ends. Two intervals `[1,3]` and `[4,6]` are **not** overlapping (gap is empty since they are adjacent). But `[1,3]` and `[3,6]` **do** overlap.',
ARRAY['0 <= intervals.length <= 10^4', '0 <= start <= end <= 10^6'],
'{"javascript": "function insertAndAnalyze(intervals, newInterval) {\n  // your code here\n}", "python": "def insert_and_analyze(intervals, new_interval):\n    pass"}',
'{"public": [{"input": {"intervals": [[1,3],[6,9]], "newInterval": [2,5]}, "expected": {"merged": [[1,5],[6,9]], "gaps": [[5,6]]}}, {"input": {"intervals": [[1,2],[3,5],[6,7],[8,10],[12,16]], "newInterval": [4,8]}, "expected": {"merged": [[1,2],[3,10],[12,16]], "gaps": [[2,3],[10,12]]}}], "hidden": [{"input": {"intervals": [], "newInterval": [5,7]}, "expected": {"merged": [[5,7]], "gaps": []}}, {"input": {"intervals": [[1,5]], "newInterval": [2,3]}, "expected": {"merged": [[1,5]], "gaps": []}}, {"input": {"intervals": [[1,2]], "newInterval": [5,6]}, "expected": {"merged": [[1,2],[5,6]], "gaps": [[2,5]]}}]}',
ARRAY['arrays', 'sorting', 'intervals']),

-- 10
('b1000000-0000-0000-0000-000000000010', 'LRU Cache with TTL', 'medium',
E'Design a data structure that acts as an LRU cache with a **time-to-live (TTL)** for each entry.\n\nImplement these operations:\n- `put(key, value, ttl)`: Insert or update a key-value pair. `ttl` is the number of seconds before this entry expires, measured from the time of this put call.\n- `get(key, timestamp)`: Return the value if the key exists and has NOT expired at the given timestamp. Otherwise return -1. A `get` counts as a "use" for LRU purposes.\n\nWhen the cache exceeds its capacity, evict the **least recently used** non-expired entry. If all entries are expired, evict any expired entry.\n\nProcess a list of operations and return the results of all `get` operations.\n\nThe timestamp starts at 0 and increases monotonically across operations.',
ARRAY['1 <= capacity <= 100', '1 <= operations.length <= 1000', 'All timestamps are non-negative and non-decreasing.'],
'{"javascript": "function lruWithTTL(capacity, operations) {\n  // your code here\n}", "python": "def lru_with_ttl(capacity, operations):\n    pass"}',
'{"public": [{"input": {"capacity": 2, "operations": [["put", 1, 10, 5, 0], ["put", 2, 20, 5, 1], ["get", 1, 2], ["get", 1, 6]]}, "expected": [10, -1]}], "hidden": [{"input": {"capacity": 1, "operations": [["put", 1, 100, 10, 0], ["put", 2, 200, 10, 1], ["get", 1, 2], ["get", 2, 2]]}, "expected": [-1, 200]}, {"input": {"capacity": 2, "operations": [["put", 1, 10, 100, 0], ["put", 2, 20, 100, 1], ["put", 3, 30, 100, 2], ["get", 1, 3], ["get", 2, 3], ["get", 3, 3]]}, "expected": [-1, 20, 30]}]}',
ARRAY['hash-map', 'design', 'linked-list']),

-- 11
('b1000000-0000-0000-0000-000000000011', 'Arithmetic Expression Tree Builder', 'medium',
E'Given a postfix (Reverse Polish Notation) expression as an array of tokens, build a binary expression tree and return its **infix** representation as a fully parenthesized string.\n\nNumbers are leaf nodes. Operators create internal nodes with left and right children.\n\nEvery binary operation should be wrapped in parentheses, e.g., `(left op right)`.\n\nA single number should NOT be wrapped in parentheses.',
ARRAY['1 <= tokens.length <= 100', 'Tokens are valid integers or one of +, -, *, /.', 'The expression is always valid.'],
'{"javascript": "function postfixToInfix(tokens) {\n  // your code here\n}", "python": "def postfix_to_infix(tokens):\n    pass"}',
'{"public": [{"input": {"tokens": ["3", "4", "+", "2", "*"]}, "expected": "((3 + 4) * 2)"}, {"input": {"tokens": ["5"]}, "expected": "5"}], "hidden": [{"input": {"tokens": ["1", "2", "+", "3", "4", "+", "*"]}, "expected": "((1 + 2) * (3 + 4))"}, {"input": {"tokens": ["10", "2", "/", "3", "-"]}, "expected": "((10 / 2) - 3)"}, {"input": {"tokens": ["1", "2", "3", "*", "+"]}, "expected": "(1 + (2 * 3))"}]}',
ARRAY['trees', 'stack', 'strings']),

-- 12
('b1000000-0000-0000-0000-000000000012', 'Flood Fill with Diagonal Boundaries', 'medium',
E'Given a 2D grid of characters and a starting position `(r, c)`, perform a flood fill with a new character `fill`.\n\nUnlike standard flood fill, this version must **not cross diagonal boundaries**.\n\nA diagonal boundary exists when two cells of the **same non-fill character** are diagonally adjacent and their two shared orthogonal neighbors are different from that boundary character.\n\nFill cells that are orthogonally connected (up, down, left, right) to the starting position and have the same character as the starting cell.\n\nReturn the grid after filling.',
ARRAY['1 <= rows, cols <= 50', 'grid[i][j] is a printable ASCII character.', '0 <= r < rows, 0 <= c < cols'],
'{"javascript": "function floodFill(grid, r, c, fill) {\n  // your code here\n}", "python": "def flood_fill(grid, r, c, fill):\n    pass"}',
'{"public": [{"input": {"grid": [[".", ".", "#"], [".", ".", "#"], ["#", "#", "#"]], "r": 0, "c": 0, "fill": "X"}, "expected": [["X", "X", "#"], ["X", "X", "#"], ["#", "#", "#"]]}, {"input": {"grid": [[".", ".", "."], [".", "#", "."], [".", ".", "."]], "r": 0, "c": 0, "fill": "X"}, "expected": [["X", "X", "X"], ["X", "#", "X"], ["X", "X", "X"]]}], "hidden": [{"input": {"grid": [[".", "#", "."], ["#", ".", "#"], [".", "#", "."]], "r": 1, "c": 1, "fill": "X"}, "expected": [[".", "#", "."], ["#", "X", "#"], [".", "#", "."]]}, {"input": {"grid": [["."]], "r": 0, "c": 0, "fill": "X"}, "expected": [["X"]]}]}',
ARRAY['graphs', 'bfs', 'matrix']),

-- 13
('b1000000-0000-0000-0000-000000000013', 'Balanced BST from Sorted Array', 'medium',
E'Given a sorted array of unique integers, construct a height-balanced Binary Search Tree (BST) and return it as an array in level-order (BFS) format.\n\nA height-balanced BST is a BST in which the depth of the two subtrees of every node never differs by more than one.\n\nWhen the subarray has an even number of elements, always pick the **left-middle** element as the root.\n\nUse `null` for missing children in the level-order output. Trim trailing nulls.',
ARRAY['1 <= nums.length <= 10^4', '-10^4 <= nums[i] <= 10^4', 'nums is sorted in strictly increasing order.'],
'{"javascript": "function sortedArrayToBST(nums) {\n  // your code here\n}", "python": "def sorted_array_to_bst(nums):\n    pass"}',
'{"public": [{"input": {"nums": [-10, -3, 0, 5, 9]}, "expected": [0, -10, 5, null, -3, null, 9]}, {"input": {"nums": [1, 3]}, "expected": [1, null, 3]}], "hidden": [{"input": {"nums": [1]}, "expected": [1]}, {"input": {"nums": [1, 2, 3, 4, 5, 6, 7]}, "expected": [4, 2, 6, 1, 3, 5, 7]}, {"input": {"nums": [1, 2, 3, 4]}, "expected": [2, 1, 3, null, null, null, 4]}]}',
ARRAY['trees', 'bst', 'recursion', 'arrays']),

-- 14
('b1000000-0000-0000-0000-000000000014', 'Fraction Calculator', 'medium',
E'Given an expression containing fractions and operators `+`, `-`, `*`, `/`, evaluate it and return the result as a simplified fraction string `"numerator/denominator"`.\n\nFractions in the input are written as `a/b` where `a` and `b` are integers. `a` can be negative.\n\nRespect standard order of operations (multiplication and division before addition and subtraction). No parentheses.\n\nThe result should be in lowest terms. If the result is negative, the negative sign should be on the numerator. If the denominator is 1, still return `"n/1"`.',
ARRAY['The expression is always valid.', 'No division by zero.', 'Fraction values fit in 64-bit integers.'],
'{"javascript": "function fractionCalc(expression) {\n  // your code here\n}", "python": "def fraction_calc(expression):\n    pass"}',
'{"public": [{"input": {"expression": "1/2 + 1/3"}, "expected": "5/6"}, {"input": {"expression": "1/2 * 2/3"}, "expected": "1/3"}], "hidden": [{"input": {"expression": "1/2 + 1/3 * 1/4"}, "expected": "7/12"}, {"input": {"expression": "3/4 - 1/4"}, "expected": "1/2"}, {"input": {"expression": "1/1 / 3/1"}, "expected": "1/3"}, {"input": {"expression": "1/2 - 3/4"}, "expected": "-1/4"}, {"input": {"expression": "-1/2 + 1/2"}, "expected": "0/1"}]}',
ARRAY['math', 'parsing', 'strings']),

-- 15
('b1000000-0000-0000-0000-000000000015', 'Snake Game State Machine', 'medium',
E'Simulate a Snake game on a `rows x cols` grid.\n\nThe snake starts at position `(0, 0)` with length 1, moving right.\n\nGiven a sequence of moves (`"U"`, `"D"`, `"L"`, `"R"`), food positions (in order they appear), and the grid dimensions, process each move and return the final score (number of food items eaten).\n\nRules:\n- The snake moves one step per move in the given direction.\n- If the snake''s head reaches a food position, it eats the food (score +1) and grows by 1. Food appears one at a time in order.\n- The game ends (return current score) if the snake hits a wall or its own body (excluding the tail tip that just moved).',
ARRAY['1 <= rows, cols <= 100', '0 <= moves.length <= 10^4', 'food positions are valid grid coordinates.'],
'{"javascript": "function snakeGame(rows, cols, food, moves) {\n  // your code here\n}", "python": "def snake_game(rows, cols, food, moves):\n    pass"}',
'{"public": [{"input": {"rows": 3, "cols": 3, "food": [[1,2],[0,1]], "moves": ["R","R","D","D","L","L","U","U"]}, "expected": 1}, {"input": {"rows": 2, "cols": 2, "food": [[0,1],[1,1],[1,0]], "moves": ["R","D","L"]}, "expected": 3}], "hidden": [{"input": {"rows": 1, "cols": 3, "food": [[0,2]], "moves": ["R","R","R"]}, "expected": 1}, {"input": {"rows": 3, "cols": 3, "food": [], "moves": ["R","R","R"]}, "expected": 0}, {"input": {"rows": 3, "cols": 3, "food": [[0,1]], "moves": ["U"]}, "expected": 0}]}',
ARRAY['simulation', 'design', 'arrays']),

-- 16
('b1000000-0000-0000-0000-000000000016', 'Strassen-style Divide and Conquer Multiply', 'medium',
E'Implement matrix multiplication for two square matrices using the standard divide-and-conquer approach (not necessarily Strassen''s, but recursive block multiplication).\n\nGiven two `n x n` matrices `A` and `B` where `n` is a power of 2, return their product `A * B`.\n\nYou must use a recursive divide-and-conquer strategy:\n1. Split each matrix into four `n/2 x n/2` submatrices.\n2. Recursively compute the 8 required products.\n3. Combine the results.\n\nBase case: when `n = 1`, return the scalar product.',
ARRAY['n is a power of 2.', '1 <= n <= 64', '-100 <= A[i][j], B[i][j] <= 100'],
'{"javascript": "function matrixMultiply(A, B) {\n  // your code here\n}", "python": "def matrix_multiply(A, B):\n    pass"}',
'{"public": [{"input": {"A": [[1,2],[3,4]], "B": [[5,6],[7,8]]}, "expected": [[19,22],[43,50]]}, {"input": {"A": [[2]], "B": [[3]]}, "expected": [[6]]}], "hidden": [{"input": {"A": [[1,0],[0,1]], "B": [[5,6],[7,8]]}, "expected": [[5,6],[7,8]]}, {"input": {"A": [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]], "B": [[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,1]]}, "expected": [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]}]}',
ARRAY['matrix', 'recursion', 'math']),

-- 17
('b1000000-0000-0000-0000-000000000017', 'Rate Limiter (Sliding Window)', 'medium',
E'Design a rate limiter using a sliding window algorithm.\n\nGiven a list of request events `(timestamp, client_id)` and a configuration of `max_requests` per `window_seconds`, for each request determine if it should be **allowed** or **rejected**.\n\nA request is allowed if the client has made fewer than `max_requests` requests in the past `window_seconds` seconds (inclusive of the current timestamp, exclusive of `timestamp - window_seconds`).\n\nReturn an array of booleans indicating whether each request was allowed.\n\nAllowed requests count toward the rate limit. Rejected requests do NOT.',
ARRAY['1 <= events.length <= 10^4', '1 <= max_requests <= 1000', '1 <= window_seconds <= 3600', 'Timestamps are non-negative and non-decreasing.'],
'{"javascript": "function rateLimiter(events, maxRequests, windowSeconds) {\n  // your code here\n}", "python": "def rate_limiter(events, max_requests, window_seconds):\n    pass"}',
'{"public": [{"input": {"events": [[0, "A"], [1, "A"], [2, "A"], [3, "A"]], "maxRequests": 3, "windowSeconds": 5}, "expected": [true, true, true, false]}, {"input": {"events": [[0, "A"], [0, "B"], [1, "A"], [1, "B"]], "maxRequests": 1, "windowSeconds": 2}, "expected": [true, true, false, false]}], "hidden": [{"input": {"events": [[0, "A"], [5, "A"], [6, "A"]], "maxRequests": 1, "windowSeconds": 5}, "expected": [true, true, false]}, {"input": {"events": [[0, "A"], [1, "A"], [6, "A"]], "maxRequests": 2, "windowSeconds": 5}, "expected": [true, true, true]}]}',
ARRAY['design', 'sliding-window', 'hash-map']),

-- 18
('b1000000-0000-0000-0000-000000000018', 'Conway Look-and-Say Derivative', 'medium',
E'In Conway''s cosmological theorem, each element of the look-and-say sequence eventually decays into a combination of 92 "atoms" (plus 2 transuranic elements).\n\nFor this problem, given a look-and-say string, split it into its **non-interacting regions** (atoms) and return them.\n\nA non-interacting region is a maximal substring such that evolving it independently produces the same result as evolving the full string. The key insight: a run of identical digits can only interact with adjacent runs if the digit counts create dependencies.\n\nSimplified rule: Split the string into groups where each group is a maximal sequence of run-length encoded pairs that form an independent unit. Two adjacent RLE pairs `(count1, digit1)` and `(count2, digit2)` belong to the **same** atom if `digit1 == digit2`.\n\nReturn the array of atom substrings.',
ARRAY['1 <= s.length <= 10^4', 's consists only of digits 1-3.'],
'{"javascript": "function lookAndSayAtoms(s) {\n  // your code here\n}", "python": "def look_and_say_atoms(s):\n    pass"}',
'{"public": [{"input": {"s": "1113213211"}, "expected": ["111321", "3211"]}, {"input": {"s": "11"}, "expected": ["11"]}], "hidden": [{"input": {"s": "1"}, "expected": ["1"]}, {"input": {"s": "123"}, "expected": ["1", "2", "3"]}, {"input": {"s": "111"}, "expected": ["111"]}, {"input": {"s": "1112"}, "expected": ["111", "2"]}, {"input": {"s": "2222"}, "expected": ["2222"]}]}',
ARRAY['strings', 'simulation', 'math']),

-- 19
('b1000000-0000-0000-0000-000000000019', 'Build Dependency Graph', 'medium',
E'Given a list of packages with their dependencies (like a package.json), determine a valid installation order. Each package has a name and a list of dependency names.\n\nAdditionally, detect and report any **circular dependencies** as arrays of the package names forming the cycle (smallest cycle, lexicographically first).\n\nReturn an object with:\n- `order`: a valid installation order (dependencies before dependents). If multiple valid orders exist, return the **lexicographically smallest** one. Empty if there are cycles.\n- `cycles`: array of cycle arrays. Empty if no cycles.',
ARRAY['1 <= packages.length <= 100', 'Package names are lowercase alphanumeric strings.'],
'{"javascript": "function resolvePackages(packages) {\n  // your code here\n}", "python": "def resolve_packages(packages):\n    pass"}',
'{"public": [{"input": {"packages": [{"name": "a", "deps": ["b", "c"]}, {"name": "b", "deps": ["c"]}, {"name": "c", "deps": []}]}, "expected": {"order": ["c", "b", "a"], "cycles": []}}, {"input": {"packages": [{"name": "a", "deps": ["b"]}, {"name": "b", "deps": ["a"]}]}, "expected": {"order": [], "cycles": [["a", "b"]]}}], "hidden": [{"input": {"packages": [{"name": "x", "deps": []}]}, "expected": {"order": ["x"], "cycles": []}}, {"input": {"packages": [{"name": "a", "deps": []}, {"name": "b", "deps": []}, {"name": "c", "deps": ["a", "b"]}]}, "expected": {"order": ["a", "b", "c"], "cycles": []}}]}',
ARRAY['graphs', 'topological-sort', 'hash-map']),

-- 20
('b1000000-0000-0000-0000-000000000020', 'A* Pathfinding on Weighted Grid', 'medium',
E'Given a 2D grid where each cell has a non-negative movement cost, find the shortest path from the top-left `(0,0)` to the bottom-right `(rows-1, cols-1)` using the A* algorithm.\n\nMovement is allowed in 4 directions (up, down, left, right). The cost to enter a cell equals that cell''s value. A cell with value `-1` is impassable.\n\nUse the **Manhattan distance** to the goal as your heuristic.\n\nReturn the total cost of the shortest path, or `-1` if no path exists.\n\nThe cost includes the starting cell.',
ARRAY['1 <= rows, cols <= 100', '-1 <= grid[i][j] <= 100'],
'{"javascript": "function aStarPath(grid) {\n  // your code here\n}", "python": "def a_star_path(grid):\n    pass"}',
'{"public": [{"input": {"grid": [[1,1,1],[1,-1,1],[1,1,1]]}, "expected": 5}, {"input": {"grid": [[1,2,3],[4,5,6],[7,8,9]]}, "expected": 21}], "hidden": [{"input": {"grid": [[1]]}, "expected": 1}, {"input": {"grid": [[1,-1],[-1,1]]}, "expected": -1}, {"input": {"grid": [[1,1,1,1],[1,-1,-1,1],[1,1,1,1]]}, "expected": 7}, {"input": {"grid": [[0,0,0],[0,0,0],[0,0,0]]}, "expected": 0}]}',
ARRAY['graphs', 'heap', 'matrix']),

-- 21
('b1000000-0000-0000-0000-000000000021', 'JSON Diff', 'medium',
E'Given two JSON objects (as nested dictionaries/objects), compute the diff between them.\n\nReturn an object describing the changes:\n- `added`: keys present in `b` but not in `a` (with their values from `b`)\n- `removed`: keys present in `a` but not in `b` (with their values from `a`)\n- `changed`: keys present in both but with different values (with `{from, to}` pairs)\n- `nested`: keys where both values are objects, containing a recursive diff\n\nOnly include non-empty categories. For comparing values, use deep equality. Arrays are compared as atomic values (not element-by-element).',
ARRAY['Objects are valid JSON objects.', 'Nesting depth <= 10.', 'Keys are strings.'],
'{"javascript": "function jsonDiff(a, b) {\n  // your code here\n}", "python": "def json_diff(a, b):\n    pass"}',
'{"public": [{"input": {"a": {"x": 1, "y": 2}, "b": {"x": 1, "z": 3}}, "expected": {"removed": {"y": 2}, "added": {"z": 3}}}, {"input": {"a": {"x": 1}, "b": {"x": 2}}, "expected": {"changed": {"x": {"from": 1, "to": 2}}}}], "hidden": [{"input": {"a": {}, "b": {}}, "expected": {}}, {"input": {"a": {"n": {"a": 1}}, "b": {"n": {"a": 2}}}, "expected": {"nested": {"n": {"changed": {"a": {"from": 1, "to": 2}}}}}}, {"input": {"a": {"x": [1,2]}, "b": {"x": [1,3]}}, "expected": {"changed": {"x": {"from": [1,2], "to": [1,3]}}}}]}',
ARRAY['hash-map', 'recursion']),

-- 22
('b1000000-0000-0000-0000-000000000022', 'Bracket Sequence Generation', 'medium',
E'Given three integers `a`, `b`, and `c` representing the number of `()`, `[]`, and `{}` pairs respectively, generate **all** valid bracket sequences containing exactly those pairs.\n\nReturn the sequences sorted lexicographically.\n\nLexicographic order of bracket types: `(` < `)` < `[` < `]` < `{` < `}`.',
ARRAY['0 <= a, b, c <= 4', 'a + b + c >= 1'],
'{"javascript": "function generateBrackets(a, b, c) {\n  // your code here\n}", "python": "def generate_brackets(a, b, c):\n    pass"}',
'{"public": [{"input": {"a": 1, "b": 0, "c": 0}, "expected": ["()"]}, {"input": {"a": 1, "b": 1, "c": 0}, "expected": ["()[]", "([])", "[()]", "[]()"]  }], "hidden": [{"input": {"a": 2, "b": 0, "c": 0}, "expected": ["(())", "()()"]}, {"input": {"a": 0, "b": 0, "c": 1}, "expected": ["{}"]}, {"input": {"a": 1, "b": 0, "c": 1}, "expected": ["(){}", "({})", "{()}", "{}"]}]}',
ARRAY['backtracking', 'recursion', 'strings']),

-- 23
('b1000000-0000-0000-0000-000000000023', 'Task Scheduler with Cooldown', 'medium',
E'Given an array of tasks represented by characters and a cooldown period `n`, find the minimum number of time units the CPU will take to finish all tasks.\n\nRules:\n- Each task takes 1 time unit.\n- The CPU can either execute a task or be idle for a time unit.\n- The same task must have at least `n` time units of cooldown between two executions.\n- The CPU can execute tasks in any order.\n\nReturn the minimum total time units.',
ARRAY['1 <= tasks.length <= 10^4', 'tasks[i] is an uppercase English letter.', '0 <= n <= 100'],
'{"javascript": "function taskScheduler(tasks, n) {\n  // your code here\n}", "python": "def task_scheduler(tasks, n):\n    pass"}',
'{"public": [{"input": {"tasks": ["A","A","A","B","B","B"], "n": 2}, "expected": 8}, {"input": {"tasks": ["A","A","A","B","B","B"], "n": 0}, "expected": 6}], "hidden": [{"input": {"tasks": ["A","A","A","A","A","A","B","C","D","E","F","G"], "n": 2}, "expected": 16}, {"input": {"tasks": ["A"], "n": 5}, "expected": 1}, {"input": {"tasks": ["A","B","C","A","B","C"], "n": 2}, "expected": 6}, {"input": {"tasks": ["A","A","A","B","B","B","C","C","C"], "n": 2}, "expected": 9}]}',
ARRAY['greedy', 'heap', 'math']),

-- 24
('b1000000-0000-0000-0000-000000000024', 'Decode Ways with Wildcards', 'medium',
E'A message encoded with the mapping A=1, B=2, ..., Z=26 contains digits and `*` wildcards.\n\n`*` can represent any digit from 1-9.\n\nGiven the encoded message string, return the total number of ways to decode it.\n\nReturn the answer modulo `10^9 + 7`.\n\nRules:\n- `0` alone cannot be decoded.\n- `10` and `20` are valid (J and T).\n- `*` alone has 9 ways (1-9).\n- Two-character combos with `*` must form valid decodings (10-26).',
ARRAY['1 <= s.length <= 10^5', 's consists of digits and *.'],
'{"javascript": "function decodeWays(s) {\n  // your code here\n}", "python": "def decode_ways(s):\n    pass"}',
'{"public": [{"input": {"s": "12"}, "expected": 2}, {"input": {"s": "*"}, "expected": 9}], "hidden": [{"input": {"s": "1*"}, "expected": 18}, {"input": {"s": "0"}, "expected": 0}, {"input": {"s": "**"}, "expected": 96}, {"input": {"s": "10"}, "expected": 1}, {"input": {"s": "2*"}, "expected": 15}, {"input": {"s": "30"}, "expected": 0}]}',
ARRAY['dynamic-programming', 'strings', 'math']),

-- 25
('b1000000-0000-0000-0000-000000000025', 'Flatten Nested Iterator', 'medium',
E'Given a nested list structure where each element is either an integer or a list (which itself can contain integers or lists), implement an iterator that returns all integers in order.\n\nThe input is a nested array. Your function should return a flat array of all integers in depth-first order.\n\nBut here''s the twist: you must implement it **lazily** - the function receives a nested structure and must return the elements one at a time via a `next()` and `hasNext()` pattern. For simplicity, just return the flattened array, but you must handle the nesting **without** first converting the entire structure to a flat array (process one element at a time using a stack).\n\nReturn the flattened array.',
ARRAY['0 <= total elements <= 10^4', 'Nesting depth <= 50.', 'Element values are integers in [-10^6, 10^6].'],
'{"javascript": "function flattenNested(nestedList) {\n  // your code here\n}", "python": "def flatten_nested(nested_list):\n    pass"}',
'{"public": [{"input": {"nestedList": [[1,1],2,[1,1]]}, "expected": [1,1,2,1,1]}, {"input": {"nestedList": [1,[4,[6]]]}, "expected": [1,4,6]}], "hidden": [{"input": {"nestedList": []}, "expected": []}, {"input": {"nestedList": [[]]}, "expected": []}, {"input": {"nestedList": [[[[[1]]]]]}, "expected": [1]}, {"input": {"nestedList": [1,2,3]}, "expected": [1,2,3]}, {"input": {"nestedList": [[1,[2]],[3,[4,[5]]]]}, "expected": [1,2,3,4,5]}]}',
ARRAY['stack', 'design', 'recursion']),

-- 26
('b1000000-0000-0000-0000-000000000026', 'Sudoku Solver', 'medium',
E'Write a program to solve a 9x9 Sudoku puzzle by filling the empty cells.\n\nA sudoku solution must satisfy all standard rules:\n1. Each row contains digits 1-9 with no repetition.\n2. Each column contains digits 1-9 with no repetition.\n3. Each of the nine 3x3 sub-boxes contains digits 1-9 with no repetition.\n\nEmpty cells are represented as `0`.\n\nIt is guaranteed that the input has exactly one solution.',
ARRAY['board.length == 9', 'board[i].length == 9', '0 <= board[i][j] <= 9'],
'{"javascript": "function solveSudoku(board) {\n  // your code here\n}", "python": "def solve_sudoku(board):\n    pass"}',
'{"public": [{"input": {"board": [[5,3,0,0,7,0,0,0,0],[6,0,0,1,9,5,0,0,0],[0,9,8,0,0,0,0,6,0],[8,0,0,0,6,0,0,0,3],[4,0,0,8,0,3,0,0,1],[7,0,0,0,2,0,0,0,6],[0,6,0,0,0,0,2,8,0],[0,0,0,4,1,9,0,0,5],[0,0,0,0,8,0,0,7,9]]}, "expected": [[5,3,4,6,7,8,9,1,2],[6,7,2,1,9,5,3,4,8],[1,9,8,3,4,2,5,6,7],[8,5,9,7,6,1,4,2,3],[4,2,6,8,5,3,7,9,1],[7,1,3,9,2,4,8,5,6],[9,6,1,5,3,7,2,8,4],[2,8,7,4,1,9,6,3,5],[3,4,5,2,8,6,1,7,9]]}], "hidden": [{"input": {"board": [[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,3,0,8,5],[0,0,1,0,2,0,0,0,0],[0,0,0,5,0,7,0,0,0],[0,0,4,0,0,0,1,0,0],[0,9,0,0,0,0,0,0,0],[5,0,0,0,0,0,0,7,3],[0,0,2,0,1,0,0,0,0],[0,0,0,0,4,0,0,0,9]]}, "expected": [[9,8,7,6,5,4,3,2,1],[2,4,6,1,7,3,9,8,5],[3,5,1,9,2,8,7,4,6],[1,2,8,5,3,7,6,9,4],[6,3,4,8,9,2,1,5,7],[7,9,5,4,6,1,8,3,2],[5,1,9,2,8,6,4,7,3],[4,7,2,3,1,9,5,6,8],[8,6,3,7,4,5,2,1,9]]}]}',
ARRAY['backtracking', 'matrix', 'recursion']),

-- 27
('b1000000-0000-0000-0000-000000000027', 'Text Justification', 'medium',
E'Given an array of words and a maximum width `maxWidth`, format the text such that each line has exactly `maxWidth` characters and is fully justified (left and right).\n\nRules:\n- Pack as many words as you can in each line.\n- Extra spaces between words should be distributed as evenly as possible. If they don''t divide evenly, the leftmost gaps get one more space.\n- The last line should be left-justified with no extra spaces between words, padded with trailing spaces.\n- A word will never exceed `maxWidth`.',
ARRAY['1 <= words.length <= 300', '1 <= words[i].length <= 20', '1 <= maxWidth <= 100'],
'{"javascript": "function fullJustify(words, maxWidth) {\n  // your code here\n}", "python": "def full_justify(words, max_width):\n    pass"}',
'{"public": [{"input": {"words": ["This", "is", "an", "example", "of", "text", "justification."], "maxWidth": 16}, "expected": ["This    is    an", "example  of text", "justification.  "]}, {"input": {"words": ["What","must","be","acknowledgment","shall","be"], "maxWidth": 16}, "expected": ["What   must   be", "acknowledgment  ", "shall be        "]}], "hidden": [{"input": {"words": ["Science","is","what","we","understand","well","enough","to","explain","to","a","computer.","Art","is","everything","else","we","do"], "maxWidth": 20}, "expected": ["Science  is  what we", "understand      well", "enough to explain to", "a  computer.  Art is", "everything  else  we", "do                  "]}, {"input": {"words": ["a"], "maxWidth": 5}, "expected": ["a    "]}]}',
ARRAY['strings', 'simulation']),

-- 28
('b1000000-0000-0000-0000-000000000028', 'Conway''s Game of Life Hashlife', 'medium',
E'Given a set of initially alive cells on an infinite grid and a number of generations `n`, return the set of alive cells after `n` generations using Conway''s Game of Life rules.\n\nInput cells are given as an array of `[x, y]` coordinates.\n\nReturn the alive cells after `n` steps as a sorted array of `[x, y]` coordinates (sorted by x, then y).\n\nSince the grid is infinite, you must handle coordinates that may become negative.',
ARRAY['0 <= initial cells <= 1000', '0 <= n <= 100', 'Coordinates fit in 32-bit integers.'],
'{"javascript": "function gameOfLifeInfinite(cells, n) {\n  // your code here\n}", "python": "def game_of_life_infinite(cells, n):\n    pass"}',
'{"public": [{"input": {"cells": [[0,0],[1,0],[2,0]], "n": 1}, "expected": [[1,-1],[1,0],[1,1]]}, {"input": {"cells": [[0,0],[0,1],[1,0],[1,1]], "n": 1}, "expected": [[0,0],[0,1],[1,0],[1,1]]}], "hidden": [{"input": {"cells": [], "n": 5}, "expected": []}, {"input": {"cells": [[0,0],[1,0],[2,0]], "n": 2}, "expected": [[0,0],[1,0],[2,0]]}, {"input": {"cells": [[0,0],[1,0],[2,0],[2,1],[1,2]], "n": 1}, "expected": [[0,0],[1,0],[1,1],[2,0],[2,1],[3,0]]}, {"input": {"cells": [[0,0]], "n": 1}, "expected": []}]}',
ARRAY['simulation', 'hash-map', 'matrix']),

-- 29
('b1000000-0000-0000-0000-000000000029', 'Run-Length Encoded String Manipulation', 'medium',
E'Given two run-length encoded strings, concatenate them and return the result in its most compact RLE form.\n\nRLE format: consecutive pairs of `(count, char)` encoded as a string like `"3a2b5c"`.\n\nWhen concatenating, if the last char of the first string matches the first char of the second string, merge their counts.\n\nAlso implement a `slice(start, end)` operation on the RLE string that returns the RLE encoding of the substring from index `start` (inclusive) to `end` (exclusive) of the decoded string, without fully decoding.\n\nGiven `rle1`, `rle2`, `start`, `end`, return an object with `concat` (the merged RLE) and `slice` (the RLE of the sliced decoded concatenation).',
ARRAY['1 <= rle strings length <= 1000', '0 <= start < end <= decoded length'],
'{"javascript": "function rleOperations(rle1, rle2, start, end) {\n  // your code here\n}", "python": "def rle_operations(rle1, rle2, start, end):\n    pass"}',
'{"public": [{"input": {"rle1": "3a2b", "rle2": "3b1c", "start": 0, "end": 5}, "expected": {"concat": "3a5b1c", "slice": "3a2b"}}, {"input": {"rle1": "2a", "rle2": "2a", "start": 1, "end": 3}, "expected": {"concat": "4a", "slice": "2a"}}], "hidden": [{"input": {"rle1": "1a", "rle2": "1b", "start": 0, "end": 2}, "expected": {"concat": "1a1b", "slice": "1a1b"}}, {"input": {"rle1": "5x", "rle2": "5x", "start": 3, "end": 7}, "expected": {"concat": "10x", "slice": "4x"}}, {"input": {"rle1": "3a3b3c", "rle2": "3d", "start": 2, "end": 10}, "expected": {"concat": "3a3b3c3d", "slice": "1a3b3c1d"}}]}',
ARRAY['strings', 'encoding', 'two-pointers']),

-- 30
('b1000000-0000-0000-0000-000000000030', 'Knuth-Morris-Pratt Implementation', 'medium',
E'Implement the KMP (Knuth-Morris-Pratt) string matching algorithm.\n\nGiven a text string `t` and a pattern string `p`, return all starting indices (0-based) where `p` occurs in `t`.\n\nYou must:\n1. Build the KMP failure function (partial match table / prefix function).\n2. Use it to find all occurrences in O(n+m) time.\n\nReturn the array of starting indices. If the pattern is not found, return an empty array.',
ARRAY['1 <= t.length <= 10^5', '1 <= p.length <= t.length'],
'{"javascript": "function kmpSearch(t, p) {\n  // your code here\n}", "python": "def kmp_search(t, p):\n    pass"}',
'{"public": [{"input": {"t": "ababcababcabc", "p": "abc"}, "expected": [2, 7, 10]}, {"input": {"t": "aaaaaa", "p": "aa"}, "expected": [0, 1, 2, 3, 4]}], "hidden": [{"input": {"t": "hello", "p": "xyz"}, "expected": []}, {"input": {"t": "abcabc", "p": "abcabc"}, "expected": [0]}, {"input": {"t": "a", "p": "a"}, "expected": [0]}, {"input": {"t": "aabaabaaab", "p": "aab"}, "expected": [0, 3, 6]}]}',
ARRAY['strings', 'arrays']),

-- 31
('b1000000-0000-0000-0000-000000000031', 'Permutation Rank', 'medium',
E'Given a string of unique characters, compute its **1-based rank** among all lexicographically sorted permutations of its characters.\n\nFor example, for `"bac"`, the permutations in order are: abc(1), acb(2), bac(3), bca(4), cab(5), cba(6). So the rank of `"bac"` is 3.\n\nReturn the rank as an integer.',
ARRAY['1 <= s.length <= 20', 'All characters in s are unique.', 's consists of lowercase English letters.'],
'{"javascript": "function permutationRank(s) {\n  // your code here\n}", "python": "def permutation_rank(s):\n    pass"}',
'{"public": [{"input": {"s": "bac"}, "expected": 3}, {"input": {"s": "abc"}, "expected": 1}], "hidden": [{"input": {"s": "cba"}, "expected": 6}, {"input": {"s": "a"}, "expected": 1}, {"input": {"s": "dcba"}, "expected": 24}, {"input": {"s": "bdca"}, "expected": 10}, {"input": {"s": "abcde"}, "expected": 1}]}',
ARRAY['math', 'strings', 'sorting']),

-- 32
('b1000000-0000-0000-0000-000000000032', 'Reservoir Sampling Verification', 'medium',
E'Reservoir sampling is an algorithm for randomly choosing `k` items from a stream of `n` items (where `n` is unknown or very large) such that each item has an equal probability of being selected.\n\nGiven an array of items and `k`, simulate the reservoir sampling algorithm deterministically using a provided sequence of random numbers.\n\nThe algorithm:\n1. Fill the reservoir with the first `k` items.\n2. For each subsequent item at index `i` (0-based, starting from `k`), generate a random index `j` from 0 to `i` (inclusive). If `j < k`, replace reservoir[j] with the current item.\n\nThe random numbers are provided as an array `randoms` where `randoms[i-k]` gives the random value for step `i`. Each value is already in the range `[0, i]`.\n\nReturn the final reservoir contents.',
ARRAY['1 <= k <= items.length', 'randoms.length == items.length - k', '0 <= randoms[i] <= k + i'],
'{"javascript": "function reservoirSample(items, k, randoms) {\n  // your code here\n}", "python": "def reservoir_sample(items, k, randoms):\n    pass"}',
'{"public": [{"input": {"items": [1,2,3,4,5], "k": 2, "randoms": [0, 3, 1]}, "expected": [3, 5]}, {"input": {"items": [10, 20, 30], "k": 3, "randoms": []}, "expected": [10, 20, 30]}], "hidden": [{"input": {"items": [1,2,3,4,5], "k": 1, "randoms": [1, 2, 0, 4]}, "expected": [4]}, {"input": {"items": ["a","b","c","d"], "k": 2, "randoms": [2, 1]}, "expected": ["a", "d"]}, {"input": {"items": [1], "k": 1, "randoms": []}, "expected": [1]}]}',
ARRAY['arrays', 'simulation', 'math']),

-- 33
('b1000000-0000-0000-0000-000000000033', 'Sparse Matrix Operations', 'medium',
E'Implement sparse matrix multiplication.\n\nSparse matrices are represented as arrays of `{row, col, value}` triples (only non-zero entries). Given two sparse matrices `A` (m x k) and `B` (k x n), return their product as a sparse matrix in the same format.\n\nThe result should only contain non-zero entries, sorted by row then column.\n\nAlso return the density of the result matrix (number of non-zero entries divided by total entries `m*n`), rounded to 4 decimal places.',
ARRAY['1 <= m, k, n <= 1000', 'Non-zero entries <= 10^4.', 'Values are integers.'],
'{"javascript": "function sparseMultiply(m, k, n, A, B) {\n  // your code here\n}", "python": "def sparse_multiply(m, k, n, A, B):\n    pass"}',
'{"public": [{"input": {"m": 2, "k": 2, "n": 2, "A": [{"row":0,"col":0,"value":1},{"row":0,"col":1,"value":2},{"row":1,"col":0,"value":3}], "B": [{"row":0,"col":0,"value":4},{"row":1,"col":1,"value":5}]}, "expected": {"entries": [{"row":0,"col":0,"value":4},{"row":0,"col":1,"value":10},{"row":1,"col":0,"value":12}], "density": 0.75}}], "hidden": [{"input": {"m": 2, "k": 2, "n": 2, "A": [], "B": [{"row":0,"col":0,"value":1}]}, "expected": {"entries": [], "density": 0}}, {"input": {"m": 1, "k": 1, "n": 1, "A": [{"row":0,"col":0,"value":3}], "B": [{"row":0,"col":0,"value":4}]}, "expected": {"entries": [{"row":0,"col":0,"value":12}], "density": 1}}]}',
ARRAY['matrix', 'hash-map', 'math']),

-- 34
('b1000000-0000-0000-0000-000000000034', 'Arithmetic Sequence in Rotated Array', 'medium',
E'You are given a sorted array that has been rotated at an unknown pivot and then had **one element removed**.\n\nThe original array (before rotation and removal) was an arithmetic sequence (constant difference between consecutive elements).\n\nFind and return the missing element.\n\nFor example: Original `[2, 4, 6, 8, 10]`, rotated to `[8, 10, 2, 4, 6]`, then 10 removed: `[8, 2, 4, 6]`. The missing element is 10.\n\nYou can assume the common difference is positive and the array has at least 3 elements.',
ARRAY['3 <= arr.length <= 10^5', 'All elements are integers.', 'Exactly one element was removed.'],
'{"javascript": "function findMissing(arr) {\n  // your code here\n}", "python": "def find_missing(arr):\n    pass"}',
'{"public": [{"input": {"arr": [8, 2, 4, 6]}, "expected": 10}, {"input": {"arr": [3, 5, 9, 1]}, "expected": 7}], "hidden": [{"input": {"arr": [10, 15, 25, 5]}, "expected": 20}, {"input": {"arr": [2, 3, 4, 5]}, "expected": 1}, {"input": {"arr": [4, 6, 8, 2]}, "expected": 10}, {"input": {"arr": [100, 200, 400, 500]}, "expected": 300}]}',
ARRAY['arrays', 'math', 'binary-search']),

-- 35
('b1000000-0000-0000-0000-000000000035', 'Undo/Redo Stack with Branching', 'medium',
E'Implement an undo/redo system that supports **branching** (like Git).\n\nOperations:\n- `execute(command)`: Execute a command (string). This clears the redo stack.\n- `undo()`: Undo the last command. Returns the undone command, or `null`.\n- `redo()`: Redo the last undone command. Returns the redone command, or `null`.\n- `branch()`: Save the current state as a named branch. Returns a branch ID.\n- `checkout(branchId)`: Restore the state of a branch. Returns `true` if successful.\n- `history()`: Return the list of currently executed commands (in order).\n\nProcess a list of operations and return the results.',
ARRAY['1 <= operations.length <= 1000'],
'{"javascript": "function undoRedoSystem(operations) {\n  // your code here\n}", "python": "def undo_redo_system(operations):\n    pass"}',
'{"public": [{"input": {"operations": [["execute","a"],["execute","b"],["undo"],["undo"],["redo"],["history"]]}, "expected": [null, null, "b", "a", "a", ["a"]]}, {"input": {"operations": [["execute","a"],["branch"],["execute","b"],["checkout",0],["history"]]}, "expected": [null, 0, null, true, ["a"]]}], "hidden": [{"input": {"operations": [["undo"],["redo"]]}, "expected": [null, null]}, {"input": {"operations": [["execute","x"],["execute","y"],["branch"],["undo"],["execute","z"],["history"],["checkout",0],["history"]]}, "expected": [null, null, 0, "y", null, ["x","z"], true, ["x","y"]]}]}',
ARRAY['design', 'stack']),

-- 36
('b1000000-0000-0000-0000-000000000036', 'CRC-32 Computation', 'medium',
E'Implement the CRC-32 checksum algorithm.\n\nGiven a byte string (as an array of integers 0-255), compute its CRC-32 value.\n\nAlgorithm:\n1. Initialize CRC to `0xFFFFFFFF`.\n2. For each byte, XOR it with the lowest byte of CRC.\n3. For each of the 8 bits, if the lowest bit is 1, right-shift CRC by 1 and XOR with the polynomial `0xEDB88320`. Otherwise, just right-shift by 1.\n4. After all bytes, XOR the final CRC with `0xFFFFFFFF`.\n\nReturn the CRC-32 as an unsigned 32-bit integer.',
ARRAY['0 <= bytes.length <= 10^4', '0 <= bytes[i] <= 255'],
'{"javascript": "function crc32(bytes) {\n  // your code here\n}", "python": "def crc32(bytes_arr):\n    pass"}',
'{"public": [{"input": {"bytes": [72, 101, 108, 108, 111]}, "expected": 907060870}, {"input": {"bytes": []}, "expected": 0}], "hidden": [{"input": {"bytes": [0]}, "expected": 3523407757}, {"input": {"bytes": [255]}, "expected": 4278190080}, {"input": {"bytes": [49, 50, 51, 52, 53, 54, 55, 56, 57]}, "expected": 3421780262}, {"input": {"bytes": [0, 0, 0, 0]}, "expected": 2117946462}]}',
ARRAY['bit-manipulation', 'math', 'encoding']),

-- 37
('b1000000-0000-0000-0000-000000000037', 'Find All Bridges in Graph', 'medium',
E'Given an undirected graph with `n` nodes (0-indexed) and a list of edges, find all **bridges**.\n\nA bridge is an edge whose removal would disconnect the graph (or increase the number of connected components).\n\nReturn the bridges as a sorted array of edges `[u, v]` where `u < v`, sorted lexicographically.\n\nUse Tarjan''s bridge-finding algorithm for O(V + E) time complexity.',
ARRAY['1 <= n <= 10^4', '0 <= edges.length <= 10^4', 'No self-loops or duplicate edges.'],
'{"javascript": "function findBridges(n, edges) {\n  // your code here\n}", "python": "def find_bridges(n, edges):\n    pass"}',
'{"public": [{"input": {"n": 5, "edges": [[0,1],[1,2],[2,0],[1,3],[3,4]]}, "expected": [[1,3],[3,4]]}, {"input": {"n": 3, "edges": [[0,1],[1,2],[0,2]]}, "expected": []}], "hidden": [{"input": {"n": 4, "edges": [[0,1],[1,2],[2,3]]}, "expected": [[0,1],[1,2],[2,3]]}, {"input": {"n": 2, "edges": [[0,1]]}, "expected": [[0,1]]}, {"input": {"n": 1, "edges": []}, "expected": []}, {"input": {"n": 6, "edges": [[0,1],[1,2],[2,0],[3,4],[4,5],[5,3],[2,3]]}, "expected": [[2,3]]}]}',
ARRAY['graphs', 'dfs']),

-- 38
('b1000000-0000-0000-0000-000000000038', 'TOTP Generator', 'medium',
E'Implement a simplified Time-based One-Time Password (TOTP) generator.\n\nGiven:\n- A secret key as an array of bytes\n- A Unix timestamp\n- A time step (default 30 seconds)\n- Number of digits (default 6)\n\nAlgorithm:\n1. Compute `T = floor(timestamp / timeStep)`.\n2. Convert `T` to an 8-byte big-endian byte array.\n3. Compute HMAC-SHA1 of `T` bytes using the secret key. (You may use a built-in HMAC function.)\n4. Dynamic truncation: take the last byte''s lower 4 bits as offset `o`. Extract 4 bytes starting at `o`, mask the first byte''s top bit, and form a 31-bit integer.\n5. Take the integer modulo `10^digits` and zero-pad to `digits` length.\n\nReturn the TOTP as a string.',
ARRAY['1 <= secret.length <= 64', '0 <= timestamp <= 2^53', '1 <= timeStep <= 3600', '4 <= digits <= 8'],
'{"javascript": "function generateTOTP(secret, timestamp, timeStep, digits) {\n  // your code here\n}", "python": "def generate_totp(secret, timestamp, time_step, digits):\n    pass"}',
'{"public": [{"input": {"secret": [49,50,51,52,53,54,55,56,57,48,49,50,51,52,53,54,55,56,57,48], "timestamp": 59, "timeStep": 30, "digits": 8}, "expected": "94287082"}], "hidden": [{"input": {"secret": [49,50,51,52,53,54,55,56,57,48,49,50,51,52,53,54,55,56,57,48], "timestamp": 1111111109, "timeStep": 30, "digits": 8}, "expected": "07081804"}, {"input": {"secret": [49,50,51,52,53,54,55,56,57,48,49,50,51,52,53,54,55,56,57,48], "timestamp": 1234567890, "timeStep": 30, "digits": 6}, "expected": "005924"}]}',
ARRAY['math', 'encoding', 'bit-manipulation']),

-- 39
('b1000000-0000-0000-0000-000000000039', 'Consistent Hashing Ring', 'medium',
E'Implement a consistent hashing ring.\n\nSupport these operations:\n- `addNode(nodeId, replicas)`: Add a node to the ring with the given number of virtual replicas. Each replica is hashed as `"nodeId:replicaIndex"` (0-indexed). Use a simple hash: sum of ASCII values of the string, multiplied by 31 for each character position (polynomial hash mod 360).\n- `removeNode(nodeId)`: Remove a node and all its replicas.\n- `getNode(key)`: Find which node a key maps to. Hash the key the same way, then find the first node position >= the hash going clockwise. If no position >= hash, wrap to the smallest position.\n\nProcess a list of operations and return the results of all `getNode` operations.',
ARRAY['1 <= operations.length <= 1000', 'Node IDs and keys are non-empty strings.'],
'{"javascript": "function consistentHash(operations) {\n  // your code here\n}", "python": "def consistent_hash(operations):\n    pass"}',
'{"public": [{"input": {"operations": [["addNode", "A", 3], ["addNode", "B", 3], ["getNode", "key1"], ["getNode", "key2"], ["removeNode", "A"], ["getNode", "key1"]]}, "expected": ["A", "B", "B"]}], "hidden": [{"input": {"operations": [["addNode", "X", 1], ["getNode", "anything"]]}, "expected": ["X"]}, {"input": {"operations": [["addNode", "A", 5], ["addNode", "B", 5], ["addNode", "C", 5], ["getNode", "test1"], ["getNode", "test2"], ["getNode", "test3"]]}, "expected": ["__validator__consistent_hash"]}]}',
ARRAY['design', 'hash-map', 'arrays']),

-- 40
('b1000000-0000-0000-0000-000000000040', 'Skip List Operations', 'medium',
E'Implement a simplified skip list that supports `insert`, `search`, and `delete` operations.\n\nA skip list is a probabilistic data structure with multiple levels of linked lists. For deterministic testing, use provided random coin flips to decide the level of each inserted element.\n\nOperations:\n- `insert(value, level)`: Insert a value at the given level (1-indexed). Level 1 = base level only. Level 2 = base + one express lane, etc.\n- `search(value)`: Return `true` if value exists, `false` otherwise.\n- `delete(value)`: Remove the value. Return `true` if found, `false` otherwise.\n\nProcess operations in order and return results of all `search` and `delete` operations.\n\nThe list should maintain sorted order at every level.',
ARRAY['1 <= operations.length <= 1000', 'Values are integers.', '1 <= level <= 4'],
'{"javascript": "function skipListOps(operations) {\n  // your code here\n}", "python": "def skip_list_ops(operations):\n    pass"}',
'{"public": [{"input": {"operations": [["insert", 3, 1], ["insert", 6, 2], ["insert", 7, 1], ["search", 6], ["search", 4], ["delete", 6], ["search", 6]]}, "expected": [true, false, true, false]}], "hidden": [{"input": {"operations": [["search", 1]]}, "expected": [false]}, {"input": {"operations": [["insert", 5, 3], ["insert", 10, 1], ["insert", 3, 2], ["delete", 5], ["search", 5], ["search", 3]]}, "expected": [true, false, true]}, {"input": {"operations": [["insert", 1, 1], ["insert", 1, 1], ["delete", 1], ["search", 1]]}, "expected": [true, false]}]}',
ARRAY['design', 'linked-list']),

-- 41
('b1000000-0000-0000-0000-000000000041', 'Minimum Spanning Tree (Kruskal)', 'medium',
E'Given an undirected weighted graph with `n` nodes (0-indexed) and a list of weighted edges, find the Minimum Spanning Tree using Kruskal''s algorithm with Union-Find.\n\nReturn an object with:\n- `totalWeight`: the total weight of the MST\n- `edges`: the edges in the MST as `[u, v, weight]` in the order they were added\n\nIf the graph is not connected, return `totalWeight: -1` and the edges collected so far.\n\nWhen multiple edges have the same weight, process them in the order they appear in the input.',
ARRAY['1 <= n <= 10^4', '0 <= edges.length <= 10^5', 'Edge weights are positive integers.'],
'{"javascript": "function kruskalMST(n, edges) {\n  // your code here\n}", "python": "def kruskal_mst(n, edges):\n    pass"}',
'{"public": [{"input": {"n": 4, "edges": [[0,1,10],[0,2,6],[0,3,5],[1,3,15],[2,3,4]]}, "expected": {"totalWeight": 19, "edges": [[2,3,4],[0,3,5],[0,1,10]]}}, {"input": {"n": 3, "edges": [[0,1,1]]}, "expected": {"totalWeight": -1, "edges": [[0,1,1]]}}], "hidden": [{"input": {"n": 1, "edges": []}, "expected": {"totalWeight": 0, "edges": []}}, {"input": {"n": 2, "edges": [[0,1,5]]}, "expected": {"totalWeight": 5, "edges": [[0,1,5]]}}, {"input": {"n": 5, "edges": [[0,1,2],[0,3,6],[1,2,3],[1,3,8],[1,4,5],[2,4,7],[3,4,9]]}, "expected": {"totalWeight": 16, "edges": [[0,1,2],[1,2,3],[1,4,5],[0,3,6]]}}]}',
ARRAY['graphs', 'greedy', 'sorting']),

-- 42
('b1000000-0000-0000-0000-000000000042', 'Bloom Filter Simulation', 'medium',
E'Implement a Bloom filter with the following specifications.\n\nA Bloom filter is a space-efficient probabilistic data structure that can test whether an element is a member of a set. False positives are possible, but false negatives are not.\n\nParameters:\n- `size`: number of bits in the bit array\n- `numHashes`: number of hash functions\n\nHash functions: Use `hash_i(item) = (h1 + i * h2) % size` where:\n- `h1 = sum of ASCII values of item % size`\n- `h2 = (sum of (ASCII value * (position+1)) for each character) % size`\n- `i` ranges from 0 to `numHashes - 1`\n\nOperations:\n- `add(item)`: Add a string to the filter.\n- `check(item)`: Return `true` if the item **might** be in the set, `false` if definitely not.\n\nProcess operations and return results of all `check` operations.',
ARRAY['1 <= size <= 10000', '1 <= numHashes <= 10', '1 <= operations.length <= 1000'],
'{"javascript": "function bloomFilter(size, numHashes, operations) {\n  // your code here\n}", "python": "def bloom_filter(size, num_hashes, operations):\n    pass"}',
'{"public": [{"input": {"size": 100, "numHashes": 3, "operations": [["add", "hello"], ["check", "hello"], ["check", "world"]]}, "expected": [true, false]}, {"input": {"size": 10, "numHashes": 2, "operations": [["add", "cat"], ["add", "dog"], ["check", "cat"], ["check", "bird"]]}, "expected": [true, false]}], "hidden": [{"input": {"size": 100, "numHashes": 3, "operations": [["check", "empty"]]}, "expected": [false]}, {"input": {"size": 5, "numHashes": 3, "operations": [["add", "a"], ["add", "b"], ["add", "c"], ["check", "a"], ["check", "d"]]}, "expected": [true, true]}]}',
ARRAY['design', 'hash-map', 'bit-manipulation']),

-- 43
('b1000000-0000-0000-0000-000000000043', 'Maximum Rectangle in Histogram', 'medium',
E'Given an array of non-negative integers representing the heights of bars in a histogram (each bar has width 1), find the area of the largest rectangle that can be formed within the histogram.\n\nUse a **stack-based** O(n) algorithm.\n\nReturn the maximum area.',
ARRAY['1 <= heights.length <= 10^5', '0 <= heights[i] <= 10^4'],
'{"javascript": "function largestRectangle(heights) {\n  // your code here\n}", "python": "def largest_rectangle(heights):\n    pass"}',
'{"public": [{"input": {"heights": [2,1,5,6,2,3]}, "expected": 10}, {"input": {"heights": [2,4]}, "expected": 4}], "hidden": [{"input": {"heights": [1]}, "expected": 1}, {"input": {"heights": [0]}, "expected": 0}, {"input": {"heights": [1,1,1,1,1]}, "expected": 5}, {"input": {"heights": [6,2,5,4,5,1,6]}, "expected": 12}, {"input": {"heights": [4,4,4,4]}, "expected": 16}, {"input": {"heights": [1,2,3,4,5]}, "expected": 9}]}',
ARRAY['stack', 'arrays']),

-- 44
('b1000000-0000-0000-0000-000000000044', 'LZ77 Compression', 'medium',
E'Implement simplified LZ77 compression.\n\nGiven a string and a sliding window size, encode the string as a sequence of tokens.\n\nEach token is either:\n- `[offset, length, next_char]`: A match found in the window. `offset` is how far back the match starts, `length` is the match length, and `next_char` is the character after the match.\n- `[0, 0, char]`: No match found, output the literal character.\n\nThe search buffer (window) looks back at most `windowSize` characters from the current position. Find the **longest** match. If multiple matches have the same length, use the one with the **smallest** offset (most recent).\n\nReturn the array of tokens.',
ARRAY['1 <= s.length <= 1000', '1 <= windowSize <= 100'],
'{"javascript": "function lz77Encode(s, windowSize) {\n  // your code here\n}", "python": "def lz77_encode(s, window_size):\n    pass"}',
'{"public": [{"input": {"s": "aabcabc", "windowSize": 6}, "expected": [[0,0,"a"],[1,1,"b"],[0,0,"c"],[3,3,null]]}, {"input": {"s": "abcd", "windowSize": 4}, "expected": [[0,0,"a"],[0,0,"b"],[0,0,"c"],[0,0,"d"]]}], "hidden": [{"input": {"s": "a", "windowSize": 1}, "expected": [[0,0,"a"]]}, {"input": {"s": "aaaa", "windowSize": 3}, "expected": [[0,0,"a"],[1,2,"a"]]}, {"input": {"s": "abcabcabc", "windowSize": 10}, "expected": [[0,0,"a"],[0,0,"b"],[0,0,"c"],[3,5,"c"]]}]}',
ARRAY['strings', 'encoding', 'sliding-window']),

-- 45
('b1000000-0000-0000-0000-000000000045', 'Deterministic Finite Automaton', 'medium',
E'Given a DFA (Deterministic Finite Automaton) definition and an input string, simulate the DFA and determine if the string is accepted.\n\nA DFA is defined by:\n- `states`: array of state names\n- `alphabet`: array of valid input characters\n- `transitions`: object mapping `"state,char"` to next state\n- `startState`: the initial state\n- `acceptStates`: array of accepting states\n\nProcess the input string character by character. If at any point there is no valid transition, the string is **rejected**.\n\nReturn an object with:\n- `accepted`: boolean\n- `path`: array of states visited (including start state and each state after processing a character)\n- `finalState`: the last state reached (or the state where it got stuck)',
ARRAY['1 <= states.length <= 100', '1 <= alphabet.length <= 26', 'Input string length <= 1000'],
'{"javascript": "function simulateDFA(dfa, input) {\n  // your code here\n}", "python": "def simulate_dfa(dfa, input_str):\n    pass"}',
'{"public": [{"input": {"dfa": {"states": ["q0","q1","q2"], "alphabet": ["0","1"], "transitions": {"q0,0": "q0", "q0,1": "q1", "q1,0": "q2", "q1,1": "q0", "q2,0": "q1", "q2,1": "q2"}, "startState": "q0", "acceptStates": ["q0"]}, "input": "110"}, "expected": {"accepted": true, "path": ["q0","q1","q0","q0"], "finalState": "q0"}}], "hidden": [{"input": {"dfa": {"states": ["q0","q1","q2"], "alphabet": ["0","1"], "transitions": {"q0,0": "q0", "q0,1": "q1", "q1,0": "q2", "q1,1": "q0", "q2,0": "q1", "q2,1": "q2"}, "startState": "q0", "acceptStates": ["q0"]}, "input": "1"}, "expected": {"accepted": false, "path": ["q0","q1"], "finalState": "q1"}}, {"input": {"dfa": {"states": ["s"], "alphabet": ["a"], "transitions": {"s,a": "s"}, "startState": "s", "acceptStates": ["s"]}, "input": ""}, "expected": {"accepted": true, "path": ["s"], "finalState": "s"}}]}',
ARRAY['simulation', 'hash-map', 'strings']),

-- 46
('b1000000-0000-0000-0000-000000000046', 'Suffix Array Construction', 'medium',
E'Given a string `s`, construct its **suffix array**: an array of indices representing all suffixes of `s` sorted in lexicographic order.\n\nThe suffix starting at index `i` is `s[i:]`.\n\nAlso compute the **LCP array** (Longest Common Prefix): `lcp[i]` is the length of the longest common prefix between the suffix at `sa[i]` and the suffix at `sa[i-1]`. The first entry `lcp[0]` is defined as 0.\n\nReturn an object with both arrays.',
ARRAY['1 <= s.length <= 10^4', 's consists of lowercase English letters.'],
'{"javascript": "function suffixArray(s) {\n  // your code here\n}", "python": "def suffix_array(s):\n    pass"}',
'{"public": [{"input": {"s": "banana"}, "expected": {"sa": [5,3,1,0,4,2], "lcp": [0,1,3,0,0,2]}}, {"input": {"s": "abc"}, "expected": {"sa": [0,1,2], "lcp": [0,0,0]}}], "hidden": [{"input": {"s": "a"}, "expected": {"sa": [0], "lcp": [0]}}, {"input": {"s": "aaa"}, "expected": {"sa": [2,1,0], "lcp": [0,1,2]}}, {"input": {"s": "abab"}, "expected": {"sa": [2,0,3,1], "lcp": [0,2,0,1]}}]}',
ARRAY['strings', 'arrays', 'sorting']),

-- 47
('b1000000-0000-0000-0000-000000000047', 'Optimal Binary Search Tree', 'medium',
E'Given `n` keys with their search probabilities, construct an optimal BST that minimizes the expected search cost.\n\nThe expected cost is: sum over all keys of `(probability[i] * depth[i])` where `depth` is 1-indexed (root is depth 1).\n\nReturn the minimum expected cost.\n\nUse dynamic programming: for each subrange of keys, try each key as root and pick the one that minimizes cost.\n\nKeys are given in sorted order with their probabilities.',
ARRAY['1 <= n <= 50', 'Probabilities sum to 1.0 (approximately).', 'All probabilities are positive.'],
'{"javascript": "function optimalBST(keys, probs) {\n  // your code here\n}", "python": "def optimal_bst(keys, probs):\n    pass"}',
'{"public": [{"input": {"keys": [10, 20, 30], "probs": [0.3, 0.4, 0.3]}, "expected": 1.6}, {"input": {"keys": [1, 2], "probs": [0.5, 0.5]}, "expected": 1.5}], "hidden": [{"input": {"keys": [5], "probs": [1.0]}, "expected": 1.0}, {"input": {"keys": [10, 20, 30, 40], "probs": [0.1, 0.2, 0.4, 0.3]}, "expected": 1.7}, {"input": {"keys": [1, 2, 3, 4, 5], "probs": [0.2, 0.2, 0.2, 0.2, 0.2]}, "expected": 2.2}]}',
ARRAY['dynamic-programming', 'trees', 'math']),

-- 48
('b1000000-0000-0000-0000-000000000048', 'Circular Buffer', 'medium',
E'Implement a circular buffer (ring buffer) of fixed capacity that supports:\n\n- `write(items)`: Write an array of items. If the buffer is full, **overwrite the oldest items**. Return the number of items overwritten.\n- `read(count)`: Read and remove up to `count` items from the buffer (FIFO order). Return the items read.\n- `peek(count)`: Like read but don''t remove items.\n- `size()`: Return current number of items in the buffer.\n\nProcess a list of operations and return results.',
ARRAY['1 <= capacity <= 1000', '1 <= operations.length <= 1000'],
'{"javascript": "function circularBuffer(capacity, operations) {\n  // your code here\n}", "python": "def circular_buffer(capacity, operations):\n    pass"}',
'{"public": [{"input": {"capacity": 3, "operations": [["write", [1,2,3]], ["read", 2], ["write", [4,5]], ["read", 3]]}, "expected": [0, [1,2], 0, [3,4,5]]}, {"input": {"capacity": 2, "operations": [["write", [1,2,3]], ["read", 2]]}, "expected": [1, [2,3]]}], "hidden": [{"input": {"capacity": 1, "operations": [["write", [1]], ["write", [2]], ["read", 1]]}, "expected": [0, 1, [2]]}, {"input": {"capacity": 3, "operations": [["size"], ["write", [1,2]], ["size"], ["peek", 2], ["size"]]}, "expected": [0, 0, 2, [1,2], 2]}, {"input": {"capacity": 2, "operations": [["write", [1,2,3,4,5]], ["read", 2]]}, "expected": [3, [4,5]]}]}',
ARRAY['design', 'arrays']),

-- 49
('b1000000-0000-0000-0000-000000000049', 'Expression Differentiation', 'medium',
E'Given a mathematical expression as a string in terms of variable `x`, compute its symbolic derivative with respect to `x`.\n\nSupported operations:\n- Constants (integers)\n- Variable `x`\n- Addition: `(expr + expr)`\n- Multiplication: `(expr * expr)`\n- Power: `(x ^ n)` where n is a positive integer constant\n\nThe expression is fully parenthesized (every operation is wrapped in parentheses).\n\nApply standard differentiation rules:\n- d/dx(constant) = 0\n- d/dx(x) = 1\n- d/dx(f + g) = f'' + g''\n- d/dx(f * g) = f''*g + f*g'' (product rule)\n- d/dx(x^n) = n*x^(n-1)\n\nReturn the derivative as a string. You do NOT need to simplify the result.',
ARRAY['1 <= expression.length <= 500', 'The expression is always valid and fully parenthesized.'],
'{"javascript": "function differentiate(expression) {\n  // your code here\n}", "python": "def differentiate(expression):\n    pass"}',
'{"public": [{"input": {"expression": "(x + 3)"}, "expected": "(1 + 0)"}, {"input": {"expression": "(x * x)"}, "expected": "((1 * x) + (x * 1))"}], "hidden": [{"input": {"expression": "x"}, "expected": "1"}, {"input": {"expression": "5"}, "expected": "0"}, {"input": {"expression": "(x ^ 3)"}, "expected": "(3 * (x ^ 2))"}, {"input": {"expression": "((x * x) + (x * 3))"}, "expected": "(((1 * x) + (x * 1)) + ((1 * 3) + (x * 0)))"}]}',
ARRAY['recursion', 'parsing', 'math', 'strings']),

-- 50
('b1000000-0000-0000-0000-000000000050', 'Maze Generator (Recursive Backtracker)', 'medium',
E'Generate a perfect maze using the Recursive Backtracker (Randomized DFS) algorithm on a `rows x cols` grid.\n\nA perfect maze has exactly one path between any two cells.\n\nFor deterministic output, instead of random neighbor selection, always try neighbors in this priority: **up, right, down, left**. When backtracking, return to the most recent cell with unvisited neighbors.\n\nStart from cell `(0, 0)`.\n\nReturn the maze as a 2D grid where:\n- `0` = passage\n- `1` = wall\n\nThe grid should be `(2*rows+1) x (2*cols+1)` with walls between and around all cells. Carved passages connect adjacent cells through the wall between them.',
ARRAY['1 <= rows, cols <= 25'],
'{"javascript": "function generateMaze(rows, cols) {\n  // your code here\n}", "python": "def generate_maze(rows, cols):\n    pass"}',
'{"public": [{"input": {"rows": 2, "cols": 2}, "expected": [[1,1,1,1,1],[1,0,0,0,1],[1,0,1,0,1],[1,0,0,0,1],[1,1,1,1,1]]}, {"input": {"rows": 1, "cols": 1}, "expected": [[1,1,1],[1,0,1],[1,1,1]]}], "hidden": [{"input": {"rows": 1, "cols": 3}, "expected": [[1,1,1,1,1,1,1],[1,0,0,0,0,0,1],[1,1,1,1,1,1,1]]}, {"input": {"rows": 3, "cols": 1}, "expected": [[1,1,1],[1,0,1],[1,0,1],[1,0,1],[1,0,1],[1,0,1],[1,1,1]]}]}',
ARRAY['recursion', 'matrix', 'dfs', 'simulation']);


-- ===================== EXAMPLES =====================

INSERT INTO examples (challenge_id, input, output, explanation) VALUES

-- Shunting Yard Parser
('b1000000-0000-0000-0000-000000000001', 'expression = "3 + 4 * 2"', '["3", "4", "2", "*", "+"]', 'Multiplication has higher precedence than addition.'),
('b1000000-0000-0000-0000-000000000001', 'expression = "2 ^ 3 ^ 2"', '["2", "3", "2", "^", "^"]', 'Exponentiation is right-associative, so 2^(3^2) not (2^3)^2.'),

-- Cron Expression Next Fire
('b1000000-0000-0000-0000-000000000002', 'cron = "30 8 * * *", current = "2024-01-15 08:00"', '"2024-01-15 08:30"', 'Fire at 8:30 every day. Current time is 8:00 so next is 8:30 today.'),
('b1000000-0000-0000-0000-000000000002', 'cron = "0 0 1 * *", current = "2024-01-01 00:00"', '"2024-02-01 00:00"', 'Current time matches exactly, so next fire is the following month.'),

-- Huffman Encoding Table
('b1000000-0000-0000-0000-000000000003', 's = "aabbc"', '{"a": "00", "b": "01", "c": "1"}', 'a and b have frequency 2, c has 1. c merges with {a,b} node.'),
('b1000000-0000-0000-0000-000000000003', 's = "aaaa"', '{"a": "0"}', 'Single unique character gets code "0".'),

-- Evaluate Boolean Expression Tree
('b1000000-0000-0000-0000-000000000004', 'expression = "&(t,|(f,t))"', 'true', 'Inner OR: f|t = true. Outer AND: t & true = true.'),
('b1000000-0000-0000-0000-000000000004', 'expression = "!(&(f,t))"', 'true', 'Inner AND: f&t = false. NOT: !false = true.'),

-- Topological Sort with Lexicographic Order
('b1000000-0000-0000-0000-000000000005', 'n = 4, edges = [[1,0],[2,0],[3,1],[3,2]]', '[0,1,2,3]', 'Lexicographically smallest valid topological order.'),
('b1000000-0000-0000-0000-000000000005', 'n = 2, edges = [[0,1],[1,0]]', '[]', 'Cycle detected, no valid ordering exists.'),

-- Regex Pattern Matcher
('b1000000-0000-0000-0000-000000000006', 's = "aab", p = "a*b"', 'true', 'a* matches "aa", then b matches "b".'),
('b1000000-0000-0000-0000-000000000006', 's = "abc", p = "ab?c"', 'true', 'b? matches exactly one "b".'),
('b1000000-0000-0000-0000-000000000006', 's = "ac", p = "ab?c"', 'true', 'b? matches zero "b"s.'),

-- Matrix Chain Multiplication Order
('b1000000-0000-0000-0000-000000000007', 'dims = [10, 30, 5, 60]', '4500', '(AB)C = 10*30*5 + 10*5*60 = 4500, which is optimal.'),
('b1000000-0000-0000-0000-000000000007', 'dims = [10, 20]', '0', 'Single matrix, no multiplication needed.'),

-- Langton's Ant Simulation
('b1000000-0000-0000-0000-000000000008', 'n = 0', '{"position": [0,0], "blackCells": 0}', 'No steps taken yet.'),
('b1000000-0000-0000-0000-000000000008', 'n = 1', '{"position": [1,0], "blackCells": 1}', 'White cell: turn right (now facing east), flip to black, move to (1,0).'),
('b1000000-0000-0000-0000-000000000008', 'n = 2', '{"position": [1,-1], "blackCells": 2}', 'At (1,0) which is white: turn right (facing south), flip to black, move to (1,-1).'),

-- Interval Merge and Gap Detection
('b1000000-0000-0000-0000-000000000009', 'intervals = [[1,3],[6,9]], newInterval = [2,5]', '{"merged": [[1,5],[6,9]], "gaps": [[5,6]]}', 'New interval merges with [1,3] to form [1,5]. Gap between [1,5] and [6,9] is [5,6].'),

-- LRU Cache with TTL
('b1000000-0000-0000-0000-000000000010', 'capacity=2, operations with put/get', '[10, -1]', 'Key 1 is found at t=2 (within TTL of 5s), but expired at t=6.'),

-- Arithmetic Expression Tree Builder
('b1000000-0000-0000-0000-000000000011', 'tokens = ["3", "4", "+", "2", "*"]', '"((3 + 4) * 2)"', 'Build tree from postfix, then produce fully parenthesized infix.'),
('b1000000-0000-0000-0000-000000000011', 'tokens = ["5"]', '"5"', 'Single number has no parentheses.'),

-- Flood Fill with Diagonal Boundaries
('b1000000-0000-0000-0000-000000000012', 'grid with "." and "#", r=0, c=0, fill="X"', 'Filled grid', 'Standard orthogonal flood fill replacing all connected "." cells with "X".'),

-- Balanced BST from Sorted Array
('b1000000-0000-0000-0000-000000000013', 'nums = [-10, -3, 0, 5, 9]', '[0, -10, 5, null, -3, null, 9]', 'Middle element (0) becomes root. Left and right subtrees are built recursively.'),
('b1000000-0000-0000-0000-000000000013', 'nums = [1, 3]', '[1, null, 3]', 'With even count, pick left-middle (1) as root. 3 becomes right child.'),

-- Fraction Calculator
('b1000000-0000-0000-0000-000000000014', 'expression = "1/2 + 1/3"', '"5/6"', 'Common denominator 6: 3/6 + 2/6 = 5/6.'),
('b1000000-0000-0000-0000-000000000014', 'expression = "1/2 + 1/3 * 1/4"', '"7/12"', 'Multiplication first: 1/3 * 1/4 = 1/12. Then 1/2 + 1/12 = 7/12.'),

-- Snake Game State Machine
('b1000000-0000-0000-0000-000000000015', 'rows=2, cols=2, food=[[0,1],[1,1],[1,0]], moves=["R","D","L"]', '3', 'Snake eats all 3 food items while navigating the 2x2 grid.'),

-- Strassen-style Matrix Multiply
('b1000000-0000-0000-0000-000000000016', 'A = [[1,2],[3,4]], B = [[5,6],[7,8]]', '[[19,22],[43,50]]', 'Standard matrix multiplication result, computed via divide-and-conquer.'),

-- Rate Limiter
('b1000000-0000-0000-0000-000000000017', 'events with 4 requests from "A", max=3, window=5', '[true, true, true, false]', 'First 3 requests allowed, 4th exceeds the limit within the window.'),
('b1000000-0000-0000-0000-000000000017', 'events from "A" and "B", max=1, window=2', '[true, true, false, false]', 'Each client has independent rate limits.'),

-- Conway Look-and-Say Derivative
('b1000000-0000-0000-0000-000000000018', 's = "1113213211"', '["111321", "3211"]', 'The string splits into two non-interacting regions.'),
('b1000000-0000-0000-0000-000000000018', 's = "123"', '["1", "2", "3"]', 'Each different digit forms its own atom.'),

-- Build Dependency Graph
('b1000000-0000-0000-0000-000000000019', 'packages a->b->c, c has no deps', '{"order": ["c","b","a"], "cycles": []}', 'Install dependencies before dependents.'),
('b1000000-0000-0000-0000-000000000019', 'packages a->b, b->a', '{"order": [], "cycles": [["a","b"]]}', 'Circular dependency detected.'),

-- A* Pathfinding
('b1000000-0000-0000-0000-000000000020', 'grid = [[1,1,1],[1,-1,1],[1,1,1]]', '5', 'Path goes around the obstacle: cost = 1+1+1+1+1 = 5.'),
('b1000000-0000-0000-0000-000000000020', 'grid = [[1,-1],[-1,1]]', '-1', 'No valid path exists.'),

-- JSON Diff
('b1000000-0000-0000-0000-000000000021', 'a = {"x":1,"y":2}, b = {"x":1,"z":3}', '{"removed":{"y":2},"added":{"z":3}}', 'y was removed, z was added, x unchanged.'),
('b1000000-0000-0000-0000-000000000021', 'a = {"n":{"a":1}}, b = {"n":{"a":2}}', '{"nested":{"n":{"changed":{"a":{"from":1,"to":2}}}}}', 'Both values are objects so diff is nested recursively.'),

-- Bracket Sequence Generation
('b1000000-0000-0000-0000-000000000022', 'a=1, b=1, c=0', '["()[]","([])", "[()]","[]()"]', 'All valid sequences with one () pair and one [] pair.'),
('b1000000-0000-0000-0000-000000000022', 'a=2, b=0, c=0', '["(())","()()"]', 'Two pairs of parentheses.'),

-- Task Scheduler with Cooldown
('b1000000-0000-0000-0000-000000000023', 'tasks = ["A","A","A","B","B","B"], n = 2', '8', 'One valid schedule: A B idle A B idle A B. Total = 8 time units.'),
('b1000000-0000-0000-0000-000000000023', 'tasks = ["A","A","A","B","B","B"], n = 0', '6', 'No cooldown needed, execute all 6 tasks consecutively.'),

-- Decode Ways with Wildcards
('b1000000-0000-0000-0000-000000000024', 's = "12"', '2', 'Can be decoded as AB (1,2) or L (12).'),
('b1000000-0000-0000-0000-000000000024', 's = "*"', '9', 'The wildcard can be 1-9, giving 9 single-letter decodings.'),
('b1000000-0000-0000-0000-000000000024', 's = "**"', '96', '9 ways for each * as single digit (81) plus valid two-digit combos (15).'),

-- Flatten Nested Iterator
('b1000000-0000-0000-0000-000000000025', 'nestedList = [[1,1],2,[1,1]]', '[1,1,2,1,1]', 'Flatten preserving depth-first order.'),
('b1000000-0000-0000-0000-000000000025', 'nestedList = [1,[4,[6]]]', '[1,4,6]', 'Deeply nested elements extracted in order.'),

-- Sudoku Solver
('b1000000-0000-0000-0000-000000000026', 'A standard Sudoku puzzle', 'The solved board', 'Backtracking fills each empty cell with valid digits until the puzzle is complete.'),

-- Text Justification
('b1000000-0000-0000-0000-000000000027', 'words = ["This","is","an","example","of","text","justification."], maxWidth = 16', '["This    is    an","example  of text","justification.  "]', 'Extra spaces distributed evenly, leftmost gaps get extras. Last line left-justified.'),

-- Conway's Game of Life Infinite
('b1000000-0000-0000-0000-000000000028', 'cells = [[0,0],[1,0],[2,0]], n = 1', '[[1,-1],[1,0],[1,1]]', 'A horizontal blinker oscillates to vertical.'),
('b1000000-0000-0000-0000-000000000028', 'cells = [[0,0],[0,1],[1,0],[1,1]], n = 1', '[[0,0],[0,1],[1,0],[1,1]]', 'A 2x2 block is a stable still life.'),

-- Run-Length Encoded String Manipulation
('b1000000-0000-0000-0000-000000000029', 'rle1 = "3a2b", rle2 = "3b1c", start = 0, end = 5', '{"concat": "3a5b1c", "slice": "3a2b"}', 'Trailing b of rle1 merges with leading b of rle2. Slice of first 5 decoded chars is "aaabb".'),

-- KMP Implementation
('b1000000-0000-0000-0000-000000000030', 't = "ababcababcabc", p = "abc"', '[2, 7, 10]', 'Pattern "abc" found at indices 2, 7, and 10.'),
('b1000000-0000-0000-0000-000000000030', 't = "aaaaaa", p = "aa"', '[0, 1, 2, 3, 4]', 'Overlapping matches are all reported.'),

-- Permutation Rank
('b1000000-0000-0000-0000-000000000031', 's = "bac"', '3', 'Permutations: abc(1), acb(2), bac(3). So rank is 3.'),
('b1000000-0000-0000-0000-000000000031', 's = "cba"', '6', 'Last permutation of 3 characters. 3! = 6.'),

-- Reservoir Sampling Verification
('b1000000-0000-0000-0000-000000000032', 'items=[1,2,3,4,5], k=2, randoms=[0,3,1]', '[3, 5]', 'Step i=2: random=0 < 2, replace pos 0 with 3. Step i=3: random=3 >= 2, skip. Step i=4: random=1 < 2, replace pos 1 with 5.'),

-- Sparse Matrix Operations
('b1000000-0000-0000-0000-000000000033', 'A (2x2) * B (2x2) sparse', '{"entries": [...], "density": 0.75}', 'Multiply sparse representations and compute density of result.'),

-- Arithmetic Sequence in Rotated Array
('b1000000-0000-0000-0000-000000000034', 'arr = [8, 2, 4, 6]', '10', 'Original: [2,4,6,8,10], rotated and 10 removed.'),
('b1000000-0000-0000-0000-000000000034', 'arr = [3, 5, 9, 1]', '7', 'Original: [1,3,5,7,9], rotated and 7 removed.'),

-- Undo/Redo Stack with Branching
('b1000000-0000-0000-0000-000000000035', 'execute a, b, undo, undo, redo, history', '[null, null, "b", "a", "a", ["a"]]', 'After undo twice and redo once, only "a" remains in history.'),

-- CRC-32 Computation
('b1000000-0000-0000-0000-000000000036', 'bytes = [72, 101, 108, 108, 111]', '907060870', 'CRC-32 of "Hello".'),
('b1000000-0000-0000-0000-000000000036', 'bytes = []', '0', 'Empty input gives CRC of 0.'),

-- Find All Bridges in Graph
('b1000000-0000-0000-0000-000000000037', 'n=5, edges with a triangle and a tail', '[[1,3],[3,4]]', 'Edges [1,3] and [3,4] are bridges. The triangle [0,1,2] has no bridges.'),

-- TOTP Generator
('b1000000-0000-0000-0000-000000000038', 'secret="12345678901234567890", timestamp=59, step=30, digits=8', '"94287082"', 'Standard TOTP test vector from RFC 6238.'),

-- Consistent Hashing Ring
('b1000000-0000-0000-0000-000000000039', 'Add nodes A and B, query keys', '["A", "B", "B"]', 'Keys map to nearest node position clockwise on the ring.'),

-- Skip List Operations
('b1000000-0000-0000-0000-000000000040', 'insert 3,6,7 then search and delete', '[true, false, true, false]', 'Search 6: found. Search 4: not found. Delete 6: removed. Search 6: not found.'),

-- Minimum Spanning Tree (Kruskal)
('b1000000-0000-0000-0000-000000000041', 'n=4, weighted edges', '{"totalWeight": 19, "edges": [[2,3,4],[0,3,5],[0,1,10]]}', 'Kruskal picks edges by weight: 4, 5, 10. Total = 19.'),

-- Bloom Filter Simulation
('b1000000-0000-0000-0000-000000000042', 'size=100, hashes=3, add "hello", check "hello" and "world"', '[true, false]', '"hello" was added so check returns true. "world" was not added.'),

-- Maximum Rectangle in Histogram
('b1000000-0000-0000-0000-000000000043', 'heights = [2,1,5,6,2,3]', '10', 'The largest rectangle spans bars with heights 5 and 6 (area = 5*2 = 10).'),
('b1000000-0000-0000-0000-000000000043', 'heights = [4,4,4,4]', '16', 'All bars same height: area = 4*4 = 16.'),

-- LZ77 Compression
('b1000000-0000-0000-0000-000000000044', 's = "aabcabc", windowSize = 6', '[[0,0,"a"],[1,1,"b"],[0,0,"c"],[3,3,null]]', 'First "a" is literal, second "a" backrefs 1, "b" and "c" literal, then "abc" matches at offset 3.'),

-- DFA Simulation
('b1000000-0000-0000-0000-000000000045', 'DFA for divisibility by 3, input = "110"', '{"accepted":true,"path":["q0","q1","q0","q0"],"finalState":"q0"}', '110 in binary = 6, divisible by 3, accepted.'),

-- Suffix Array Construction
('b1000000-0000-0000-0000-000000000046', 's = "banana"', '{"sa":[5,3,1,0,4,2],"lcp":[0,1,3,0,0,2]}', 'Suffixes sorted: a, ana, anana, banana, na, nana.'),

-- Optimal Binary Search Tree
('b1000000-0000-0000-0000-000000000047', 'keys = [10,20,30], probs = [0.3,0.4,0.3]', '1.6', 'Optimal: 20 at root (depth 1), 10 and 30 at depth 2. Cost = 0.4*1 + 0.3*2 + 0.3*2 = 1.6.'),

-- Circular Buffer
('b1000000-0000-0000-0000-000000000048', 'capacity=3, write [1,2,3], read 2, write [4,5], read 3', '[0, [1,2], 0, [3,4,5]]', 'Buffer manages FIFO with fixed capacity.'),
('b1000000-0000-0000-0000-000000000048', 'capacity=2, write [1,2,3], read 2', '[1, [2,3]]', 'Writing 3 items to capacity-2 buffer overwrites 1 item.'),

-- Expression Differentiation
('b1000000-0000-0000-0000-000000000049', 'expression = "(x + 3)"', '"(1 + 0)"', 'd/dx(x) = 1, d/dx(3) = 0.'),
('b1000000-0000-0000-0000-000000000049', 'expression = "(x ^ 3)"', '"(3 * (x ^ 2))"', 'Power rule: d/dx(x^3) = 3*x^2.'),

-- Maze Generator
('b1000000-0000-0000-0000-000000000050', 'rows = 1, cols = 1', '[[1,1,1],[1,0,1],[1,1,1]]', 'A single cell maze: just one passage surrounded by walls.'),
('b1000000-0000-0000-0000-000000000050', 'rows = 2, cols = 2', '5x5 grid with walls and passages', 'Recursive backtracker starting from (0,0), trying up/right/down/left in order.');
