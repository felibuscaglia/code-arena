-- 50 Unique Hard Challenges for CodePVP
-- Designed to be rare on other platforms and tricky for LLMs to solve correctly.

INSERT INTO challenges (id, title, difficulty, description, constraints, starter_code, test_cases, tags) VALUES

-- 1
('c1000000-0000-0000-0000-000000000001', 'Aho-Corasick Multi-Pattern Search', 'hard',
E'Implement the Aho-Corasick algorithm for simultaneous multi-pattern string matching.\n\nGiven a text string and a list of pattern strings, find all occurrences of every pattern in the text.\n\nBuild the Aho-Corasick automaton:\n1. Construct a trie from all patterns.\n2. Build failure links (similar to KMP failure function, but on a trie).\n3. Search the text in a single pass.\n\nReturn an array of objects `{pattern, index}` sorted by index (then by pattern lexicographically for ties), where `index` is the starting position of the match in the text.',
ARRAY['1 <= text.length <= 10^5', '1 <= patterns.length <= 1000', '1 <= patterns[i].length <= 100', 'All strings consist of lowercase English letters.'],
'{"javascript": "function ahoCorasick(text, patterns) {\n  // your code here\n}", "python": "def aho_corasick(text, patterns):\n    pass"}',
'{"public": [{"input": {"text": "abcabcabc", "patterns": ["abc", "bc", "cab"]}, "expected": [{"pattern": "abc", "index": 0}, {"pattern": "bc", "index": 1}, {"pattern": "cab", "index": 2}, {"pattern": "abc", "index": 3}, {"pattern": "bc", "index": 4}, {"pattern": "cab", "index": 5}, {"pattern": "abc", "index": 6}, {"pattern": "bc", "index": 7}]}], "hidden": [{"input": {"text": "aaaa", "patterns": ["a", "aa"]}, "expected": [{"pattern": "a", "index": 0}, {"pattern": "aa", "index": 0}, {"pattern": "a", "index": 1}, {"pattern": "aa", "index": 1}, {"pattern": "a", "index": 2}, {"pattern": "aa", "index": 2}, {"pattern": "a", "index": 3}]}, {"input": {"text": "xyz", "patterns": ["abc"]}, "expected": []}]}',
ARRAY['strings', 'trees', 'graphs']),

-- 2
('c1000000-0000-0000-0000-000000000002', 'Suffix Automaton Construction', 'hard',
E'Build a Suffix Automaton (SAM) for a given string and use it to answer queries.\n\nA Suffix Automaton is the smallest DFA that accepts all suffixes of a string.\n\nGiven a string `s` and a list of query strings, for each query return:\n- `count`: how many times the query appears as a substring of `s`\n- `first`: the index of the first occurrence (-1 if not found)\n\nBuild the SAM in O(n) time and answer each query by traversing the automaton.',
ARRAY['1 <= s.length <= 10^5', '1 <= queries.length <= 1000', '1 <= queries[i].length <= s.length', 'All strings consist of lowercase English letters.'],
'{"javascript": "function suffixAutomaton(s, queries) {\n  // your code here\n}", "python": "def suffix_automaton(s, queries):\n    pass"}',
'{"public": [{"input": {"s": "abcbc", "queries": ["bc", "abc", "d"]}, "expected": [{"count": 2, "first": 1}, {"count": 1, "first": 0}, {"count": 0, "first": -1}]}], "hidden": [{"input": {"s": "aaaaaa", "queries": ["a", "aa", "aaa", "aaaaaaa"]}, "expected": [{"count": 6, "first": 0}, {"count": 5, "first": 0}, {"count": 4, "first": 0}, {"count": 0, "first": -1}]}, {"input": {"s": "abcd", "queries": ["abcd", "bcd", "cd", "d", "e"]}, "expected": [{"count": 1, "first": 0}, {"count": 1, "first": 1}, {"count": 1, "first": 2}, {"count": 1, "first": 3}, {"count": 0, "first": -1}]}]}',
ARRAY['strings', 'graphs', 'design']),

-- 3
('c1000000-0000-0000-0000-000000000003', 'Van Emde Boas Tree Operations', 'hard',
E'Implement a simplified Van Emde Boas tree that supports the following operations on a universe of integers `[0, u)` where `u` is a power of 2:\n\n- `insert(x)`: Insert integer x.\n- `delete(x)`: Delete integer x.\n- `member(x)`: Return true if x is in the set.\n- `successor(x)`: Return the smallest element greater than x, or -1 if none.\n- `predecessor(x)`: Return the largest element less than x, or -1 if none.\n- `min()`: Return the minimum element, or -1 if empty.\n- `max()`: Return the maximum element, or -1 if empty.\n\nAll operations should run in O(log log u) time.\n\nProcess a list of operations and return results of all query operations.',
ARRAY['u is a power of 2.', '4 <= u <= 2^16', '0 <= x < u', '1 <= operations.length <= 10^4'],
'{"javascript": "function vEBTree(u, operations) {\n  // your code here\n}", "python": "def veb_tree(u, operations):\n    pass"}',
'{"public": [{"input": {"u": 16, "operations": [["insert", 2], ["insert", 5], ["insert", 14], ["successor", 5], ["predecessor", 14], ["min"], ["max"]]}, "expected": [14, 5, 2, 14]}], "hidden": [{"input": {"u": 16, "operations": [["insert", 3], ["insert", 7], ["delete", 3], ["member", 3], ["member", 7], ["successor", 3], ["predecessor", 7]]}, "expected": [false, true, 7, -1]}, {"input": {"u": 4, "operations": [["min"], ["insert", 0], ["insert", 3], ["min"], ["max"], ["successor", 0], ["predecessor", 3]]}, "expected": [-1, 0, 3, 3, 0]}]}',
ARRAY['design', 'recursion', 'trees']),

-- 4
('c1000000-0000-0000-0000-000000000004', 'Maximum Flow (Dinic''s Algorithm)', 'hard',
E'Given a directed graph with capacities on each edge, find the maximum flow from a source node `s` to a sink node `t` using Dinic''s algorithm.\n\nDinic''s algorithm:\n1. Build a level graph using BFS from the source.\n2. Find blocking flows using DFS on the level graph.\n3. Repeat until no path from s to t exists in the level graph.\n\nReturn the maximum flow value.\n\nEdges are given as `[from, to, capacity]`. There may be multiple edges between the same pair of nodes.',
ARRAY['2 <= n <= 500', '0 <= edges.length <= 5000', 'Capacities are positive integers <= 10^6.', '0 <= s, t < n', 's != t'],
'{"javascript": "function maxFlow(n, edges, s, t) {\n  // your code here\n}", "python": "def max_flow(n, edges, s, t):\n    pass"}',
'{"public": [{"input": {"n": 4, "edges": [[0,1,10],[0,2,10],[1,3,10],[2,3,10],[1,2,5]], "s": 0, "t": 3}, "expected": 20}, {"input": {"n": 2, "edges": [[0,1,5],[0,1,3]], "s": 0, "t": 1}, "expected": 8}], "hidden": [{"input": {"n": 6, "edges": [[0,1,16],[0,2,13],[1,2,10],[1,3,12],[2,1,4],[2,4,14],[3,2,9],[3,5,20],[4,3,7],[4,5,4]], "s": 0, "t": 5}, "expected": 23}, {"input": {"n": 2, "edges": [], "s": 0, "t": 1}, "expected": 0}]}',
ARRAY['graphs', 'bfs', 'dfs']),

-- 5
('c1000000-0000-0000-0000-000000000005', 'Persistent Segment Tree', 'hard',
E'Implement a persistent segment tree that supports:\n\n- `build(arr)`: Build the initial segment tree from array `arr`.\n- `update(version, index, value)`: Create a new version by updating `arr[index]` to `value` in the given version. Return the new version number.\n- `query(version, left, right)`: Return the sum of elements in range `[left, right]` (inclusive) for the given version.\n\nVersions are 0-indexed. The initial build creates version 0.\n\nEach update creates a new version without modifying previous versions. This allows querying any historical version.\n\nProcess a list of operations and return results of all query operations.',
ARRAY['1 <= arr.length <= 10^4', '-10^4 <= arr[i] <= 10^4', '1 <= operations.length <= 10^4'],
'{"javascript": "function persistentSegTree(arr, operations) {\n  // your code here\n}", "python": "def persistent_seg_tree(arr, operations):\n    pass"}',
'{"public": [{"input": {"arr": [1, 2, 3, 4, 5], "operations": [["query", 0, 0, 4], ["update", 0, 2, 10], ["query", 1, 0, 4], ["query", 0, 0, 4]]}, "expected": [15, 22, 15]}], "hidden": [{"input": {"arr": [5], "operations": [["query", 0, 0, 0], ["update", 0, 0, 3], ["query", 0, 0, 0], ["query", 1, 0, 0]]}, "expected": [5, 5, 3]}, {"input": {"arr": [1, 1, 1, 1], "operations": [["update", 0, 0, 5], ["update", 0, 1, 5], ["query", 1, 0, 3], ["query", 2, 0, 3]]}, "expected": [8, 8]}]}',
ARRAY['trees', 'design', 'arrays']),

-- 6
('c1000000-0000-0000-0000-000000000006', 'Convex Hull with Gift Wrapping', 'hard',
E'Given a set of 2D points, compute the convex hull using the **Gift Wrapping (Jarvis March)** algorithm.\n\nReturn the vertices of the convex hull in counter-clockwise order, starting from the leftmost point (break ties by lowest y).\n\nHandle collinear points on the hull: include all points that lie on the hull boundary.\n\nReturn the hull points as an array of `[x, y]` pairs.',
ARRAY['3 <= points.length <= 10^4', '-10^6 <= x, y <= 10^6', 'Not all points are collinear.'],
'{"javascript": "function convexHull(points) {\n  // your code here\n}", "python": "def convex_hull(points):\n    pass"}',
'{"public": [{"input": {"points": [[0,0],[1,0],[1,1],[0,1],[0.5,0.5]]}, "expected": [[0,0],[1,0],[1,1],[0,1]]}, {"input": {"points": [[0,0],[2,0],[1,1],[1,0]]}, "expected": [[0,0],[1,0],[2,0],[1,1]]}], "hidden": [{"input": {"points": [[0,0],[1,0],[2,0],[0,1],[1,1],[2,1],[0,2],[1,2],[2,2]]}, "expected": [[0,0],[1,0],[2,0],[2,1],[2,2],[1,2],[0,2],[0,1]]}, {"input": {"points": [[0,0],[3,0],[0,4]]}, "expected": [[0,0],[3,0],[0,4]]}]}',
ARRAY['math', 'sorting', 'arrays']),

-- 7
('c1000000-0000-0000-0000-000000000007', 'Heavy-Light Decomposition', 'hard',
E'Implement Heavy-Light Decomposition on a rooted tree to efficiently handle path queries.\n\nGiven a tree with `n` nodes (0-indexed, rooted at 0) where each node has a value, support:\n\n- `query(u, v)`: Return the maximum value on the path from node `u` to node `v`.\n- `update(node, value)`: Update the value of a node.\n\nThe HLD should decompose the tree into chains so that any root-to-leaf path crosses at most O(log n) chains. Use a segment tree on each chain for efficient queries.\n\nProcess a list of operations and return results of all query operations.',
ARRAY['1 <= n <= 10^4', '1 <= operations.length <= 10^4', 'Node values fit in 32-bit integers.'],
'{"javascript": "function hldTree(n, edges, values, operations) {\n  // your code here\n}", "python": "def hld_tree(n, edges, values, operations):\n    pass"}',
'{"public": [{"input": {"n": 5, "edges": [[0,1],[0,2],[1,3],[1,4]], "values": [1,5,2,3,4], "operations": [["query", 3, 4], ["query", 3, 2], ["update", 1, 10], ["query", 3, 4]]}, "expected": [5, 5, 10]}], "hidden": [{"input": {"n": 3, "edges": [[0,1],[1,2]], "values": [1,2,3], "operations": [["query", 0, 2], ["update", 1, 5], ["query", 0, 2]]}, "expected": [3, 5]}, {"input": {"n": 1, "edges": [], "values": [42], "operations": [["query", 0, 0]]}, "expected": [42]}]}',
ARRAY['trees', 'design', 'dfs']),

-- 8
('c1000000-0000-0000-0000-000000000008', 'Minimum Cost Maximum Flow', 'hard',
E'Given a directed graph where each edge has both a capacity and a cost per unit of flow, find the minimum cost to push the maximum flow from source `s` to sink `t`.\n\nUse the Successive Shortest Paths algorithm with Bellman-Ford (or SPFA) for finding shortest paths:\n1. Find the shortest path (minimum cost) from s to t using available capacity.\n2. Push as much flow as possible along this path.\n3. Repeat until no augmenting path exists.\n\nReturn an object with `maxFlow` and `minCost`.\n\nEdges are given as `[from, to, capacity, cost]`.',
ARRAY['2 <= n <= 200', '0 <= edges.length <= 1000', 'Capacities are positive.', 'Costs can be 0 or positive.', 'No negative cost cycles.'],
'{"javascript": "function minCostMaxFlow(n, edges, s, t) {\n  // your code here\n}", "python": "def min_cost_max_flow(n, edges, s, t):\n    pass"}',
'{"public": [{"input": {"n": 4, "edges": [[0,1,2,1],[0,2,1,4],[1,3,1,2],[2,3,2,1]], "s": 0, "t": 3}, "expected": {"maxFlow": 3, "minCost": 8}}], "hidden": [{"input": {"n": 3, "edges": [[0,1,5,1],[0,2,5,2],[1,2,3,1],[2,1,3,1]], "s": 0, "t": 2}, "expected": {"maxFlow": 8, "minCost": 14}}, {"input": {"n": 2, "edges": [[0,1,10,5]], "s": 0, "t": 1}, "expected": {"maxFlow": 10, "minCost": 50}}]}',
ARRAY['graphs', 'dynamic-programming']),

-- 9
('c1000000-0000-0000-0000-000000000009', 'Centroid Decomposition', 'hard',
E'Implement centroid decomposition of a tree and use it to answer distance queries efficiently.\n\nCentroid decomposition recursively finds the centroid of each subtree, removes it, and recurses on the resulting components.\n\nGiven a weighted tree with `n` nodes and edge weights, build the centroid decomposition and answer queries:\n\n- `count_within(node, dist)`: Return the number of nodes within distance `dist` from `node` (inclusive of `node` itself).\n\nProcess operations and return results.',
ARRAY['1 <= n <= 10^4', '1 <= operations.length <= 10^4', 'Edge weights are positive integers <= 10^6.'],
'{"javascript": "function centroidDecomp(n, edges, operations) {\n  // your code here\n}", "python": "def centroid_decomp(n, edges, operations):\n    pass"}',
'{"public": [{"input": {"n": 5, "edges": [[0,1,1],[1,2,1],[1,3,2],[3,4,1]], "operations": [["count_within", 1, 1], ["count_within", 0, 3]]}, "expected": [3, 4]}], "hidden": [{"input": {"n": 3, "edges": [[0,1,5],[1,2,5]], "operations": [["count_within", 0, 4], ["count_within", 0, 5], ["count_within", 1, 5]]}, "expected": [1, 2, 3]}, {"input": {"n": 1, "edges": [], "operations": [["count_within", 0, 0]]}, "expected": [1]}]}',
ARRAY['trees', 'dfs', 'design']),

-- 10
('c1000000-0000-0000-0000-000000000010', 'Burrows-Wheeler Transform', 'hard',
E'Implement the Burrows-Wheeler Transform (BWT) and its inverse.\n\nThe BWT rearranges a string into runs of similar characters, making it more compressible.\n\nAlgorithm:\n1. Append a special end-of-string character `$` (which sorts before all other characters).\n2. Form all rotations of the string.\n3. Sort the rotations lexicographically.\n4. The BWT is the last column of the sorted rotation matrix.\n5. Also return the row index where the original string (with `$`) appears.\n\nFor the inverse: given the BWT string and the row index, reconstruct the original string (without the `$`).\n\nImplement both `encode(s)` and `decode(bwt, row)`. Process a list of operations.',
ARRAY['1 <= s.length <= 10^4', 's consists of lowercase English letters.'],
'{"javascript": "function bwtOperations(operations) {\n  // your code here\n}", "python": "def bwt_operations(operations):\n    pass"}',
'{"public": [{"input": {"operations": [["encode", "banana"], ["decode", "annb$aa", 4]]}, "expected": [{"bwt": "annb$aa", "row": 4}, "banana"]}], "hidden": [{"input": {"operations": [["encode", "abracadabra"]]}, "expected": [{"bwt": "ard$rcaaaabb", "row": 3}]}, {"input": {"operations": [["encode", "a"]]}, "expected": [{"bwt": "a$", "row": 1}]}, {"input": {"operations": [["decode", "a$", 1]]}, "expected": ["a"]}]}',
ARRAY['strings', 'sorting', 'encoding']),

-- 11
('c1000000-0000-0000-0000-000000000011', 'Dancing Links (DLX) Exact Cover', 'hard',
E'Implement Knuth''s Algorithm X with Dancing Links (DLX) to solve the exact cover problem.\n\nGiven a binary matrix where each row is a subset and each column is an element, find a collection of rows such that every column has exactly one 1.\n\nThe matrix is given as an array of arrays of 0s and 1s.\n\nReturn all solutions, where each solution is a sorted array of row indices (0-based). Sort solutions lexicographically.\n\nIf no solution exists, return an empty array.',
ARRAY['1 <= rows <= 100', '1 <= cols <= 100', 'Matrix values are 0 or 1.'],
'{"javascript": "function exactCover(matrix) {\n  // your code here\n}", "python": "def exact_cover(matrix):\n    pass"}',
'{"public": [{"input": {"matrix": [[1,0,0,1,0,0,1],[1,0,0,1,0,0,0],[0,0,0,1,1,0,1],[0,0,1,0,1,1,0],[0,1,1,0,0,1,1],[0,1,0,0,0,0,1]]}, "expected": [[1,3,5]]}, {"input": {"matrix": [[1,0],[0,1],[1,1]]}, "expected": [[0,1],[2]]}], "hidden": [{"input": {"matrix": [[1,0],[0,1]]}, "expected": [[0,1]]}, {"input": {"matrix": [[1,1],[1,0],[0,1]]}, "expected": [[0],[1,2]]}, {"input": {"matrix": [[1,0],[1,0]]}, "expected": []}]}',
ARRAY['backtracking', 'linked-list', 'design']),

-- 12
('c1000000-0000-0000-0000-000000000012', 'Treap with Split and Merge', 'hard',
E'Implement a Treap (tree + heap) that supports split and merge operations, enabling efficient order-statistic queries.\n\nOperations:\n- `insert(value, priority)`: Insert a value with given priority.\n- `delete(value)`: Delete a value.\n- `kth(k)`: Return the k-th smallest element (1-indexed).\n- `count_less(value)`: Return the count of elements strictly less than value.\n- `split(value)`: Conceptually split the treap into elements < value and >= value. Return the sizes of both parts.\n\nMaintain BST property on values and max-heap property on priorities.\n\nProcess operations and return results of query operations.',
ARRAY['1 <= operations.length <= 10^4', 'Values and priorities are integers.', 'All values are unique.'],
'{"javascript": "function treapOps(operations) {\n  // your code here\n}", "python": "def treap_ops(operations):\n    pass"}',
'{"public": [{"input": {"operations": [["insert", 5, 10], ["insert", 3, 20], ["insert", 7, 15], ["kth", 1], ["kth", 2], ["count_less", 5], ["split", 5]]}, "expected": [3, 5, 1, [1, 2]]}], "hidden": [{"input": {"operations": [["insert", 1, 5], ["insert", 2, 10], ["insert", 3, 7], ["delete", 2], ["kth", 2], ["count_less", 3]]}, "expected": [3, 1]}, {"input": {"operations": [["insert", 10, 1], ["kth", 1], ["count_less", 11], ["split", 10]]}, "expected": [10, 1, [0, 1]]}]}',
ARRAY['trees', 'design', 'sorting']),

-- 13
('c1000000-0000-0000-0000-000000000013', 'SAT Solver (DPLL)', 'hard',
E'Implement a basic SAT solver using the DPLL (Davis-Putnam-Logemann-Loveland) algorithm.\n\nGiven a boolean formula in Conjunctive Normal Form (CNF):\n- Variables are positive integers.\n- A literal is a variable (positive) or its negation (negative).\n- A clause is an array of literals (OR of literals).\n- The formula is an array of clauses (AND of clauses).\n\nFind a satisfying assignment or determine that none exists.\n\nImplement:\n- Unit propagation\n- Pure literal elimination\n- Branching with backtracking\n\nReturn an object with `satisfiable` (boolean) and `assignment` (object mapping variable numbers to true/false) if satisfiable, or `null` for assignment if not.',
ARRAY['1 <= numVars <= 50', '1 <= clauses.length <= 200', '1 <= clause.length <= 10'],
'{"javascript": "function dpllSolve(numVars, clauses) {\n  // your code here\n}", "python": "def dpll_solve(num_vars, clauses):\n    pass"}',
'{"public": [{"input": {"numVars": 3, "clauses": [[1, -2], [2, 3], [-1, -3]]}, "expected": {"satisfiable": true, "assignment": "__validator__sat"}}, {"input": {"numVars": 2, "clauses": [[1], [-1], [2]]}, "expected": {"satisfiable": false, "assignment": null}}], "hidden": [{"input": {"numVars": 1, "clauses": [[1]]}, "expected": {"satisfiable": true, "assignment": {"1": true}}}, {"input": {"numVars": 3, "clauses": [[1,2,3],[-1,-2,-3],[1,-2],[2,-3],[-1,3]]}, "expected": {"satisfiable": true, "assignment": "__validator__sat"}}, {"input": {"numVars": 2, "clauses": [[1,2],[1,-2],[-1,2],[-1,-2]]}, "expected": {"satisfiable": false, "assignment": null}}]}',
ARRAY['backtracking', 'recursion']),

-- 14
('c1000000-0000-0000-0000-000000000014', 'Strongly Connected Components (Tarjan)', 'hard',
E'Implement Tarjan''s algorithm to find all Strongly Connected Components (SCCs) in a directed graph.\n\nA strongly connected component is a maximal set of vertices such that there is a path from each vertex to every other vertex in the set.\n\nReturn the SCCs as an array of arrays, where each inner array contains the nodes of one SCC, sorted in ascending order. The outer array should be sorted in reverse topological order of the SCC DAG (i.e., a component that can reach another comes later).',
ARRAY['1 <= n <= 10^4', '0 <= edges.length <= 10^4', 'Nodes are 0-indexed.'],
'{"javascript": "function tarjanSCC(n, edges) {\n  // your code here\n}", "python": "def tarjan_scc(n, edges):\n    pass"}',
'{"public": [{"input": {"n": 5, "edges": [[1,0],[0,2],[2,1],[0,3],[3,4]]}, "expected": [[4],[3],[0,1,2]]}, {"input": {"n": 3, "edges": [[0,1],[1,2],[2,0]]}, "expected": [[0,1,2]]}], "hidden": [{"input": {"n": 4, "edges": [[0,1],[1,2],[2,3]]}, "expected": [[3],[2],[1],[0]]}, {"input": {"n": 1, "edges": []}, "expected": [[0]]}, {"input": {"n": 8, "edges": [[0,1],[1,2],[2,0],[3,4],[4,5],[5,3],[6,7],[7,6],[2,3],[5,6]]}, "expected": [[6,7],[3,4,5],[0,1,2]]}]}',
ARRAY['graphs', 'dfs', 'stack']),

-- 15
('c1000000-0000-0000-0000-000000000015', 'Earley Parser', 'hard',
E'Implement an Earley parser for context-free grammars.\n\nGiven a grammar in the form of production rules and an input string, determine if the string can be parsed by the grammar, and if so, return one valid parse tree.\n\nGrammar format: each rule is `{lhs: "Symbol", rhs: ["S1", "S2", ...]}` where lowercase strings are terminals and uppercase strings are non-terminals.\n\nThe start symbol is always `"S"`.\n\nReturn an object with:\n- `accepted`: boolean\n- `tree`: a nested object `{symbol, children}` if accepted, null otherwise. Terminal nodes have `{symbol, value}` instead.\n\nProcess the Earley chart (prediction, scanning, completion) left to right.',
ARRAY['1 <= rules.length <= 50', '1 <= input.length <= 100', 'Grammar may be ambiguous (return any valid parse).'],
'{"javascript": "function earleyParse(rules, input) {\n  // your code here\n}", "python": "def earley_parse(rules, input_str):\n    pass"}',
'{"public": [{"input": {"rules": [{"lhs": "S", "rhs": ["a", "S", "b"]}, {"lhs": "S", "rhs": ["a", "b"]}], "input": "aabb"}, "expected": {"accepted": true, "tree": {"symbol": "S", "children": [{"symbol": "a", "value": "a"}, {"symbol": "S", "children": [{"symbol": "a", "value": "a"}, {"symbol": "b", "value": "b"}]}, {"symbol": "b", "value": "b"}]}}}], "hidden": [{"input": {"rules": [{"lhs": "S", "rhs": ["a"]}], "input": "a"}, "expected": {"accepted": true, "tree": {"symbol": "S", "children": [{"symbol": "a", "value": "a"}]}}}, {"input": {"rules": [{"lhs": "S", "rhs": ["a", "b"]}], "input": "ba"}, "expected": {"accepted": false, "tree": null}}]}',
ARRAY['parsing', 'recursion', 'design']),

-- 16
('c1000000-0000-0000-0000-000000000016', 'Rope Data Structure', 'hard',
E'Implement a Rope data structure for efficient string manipulation.\n\nA Rope is a balanced binary tree where leaves hold substrings. It supports efficient concatenation, splitting, and indexing on very long strings.\n\nOperations:\n- `build(s)`: Build a rope from string s.\n- `concat(rope1, rope2)`: Concatenate two ropes.\n- `split(rope, index)`: Split rope into [0, index) and [index, length).\n- `insert(rope, index, s)`: Insert string s at position index.\n- `delete(rope, start, end)`: Delete characters in range [start, end).\n- `charAt(rope, index)`: Return character at index.\n- `substring(rope, start, end)`: Return substring [start, end).\n- `toString(rope)`: Return the full string.\n\nProcess operations sequentially (each operates on the result of the previous). Return results of charAt, substring, and toString operations.',
ARRAY['Total string length <= 10^5.', '1 <= operations.length <= 10^4.'],
'{"javascript": "function ropeOps(operations) {\n  // your code here\n}", "python": "def rope_ops(operations):\n    pass"}',
'{"public": [{"input": {"operations": [["build", "Hello World"], ["charAt", 4], ["insert", 5, ","], ["toString"], ["delete", 0, 5], ["toString"]]}, "expected": ["o", "Hello, World", ", World"]}], "hidden": [{"input": {"operations": [["build", "abcdef"], ["split", 3], ["toString"], ["substring", 0, 3]]}, "expected": ["abc", "abc"]}, {"input": {"operations": [["build", ""], ["insert", 0, "test"], ["toString"]]}, "expected": ["test"]}]}',
ARRAY['design', 'trees', 'strings']),

-- 17
('c1000000-0000-0000-0000-000000000017', 'Raft Consensus Simulation', 'hard',
E'Simulate a simplified Raft consensus algorithm with `n` nodes.\n\nImplement:\n- **Leader election**: Nodes have election timeouts. When a timeout fires, a node becomes a candidate and requests votes. A candidate needs a majority to become leader.\n- **Log replication**: The leader appends entries and replicates to followers. An entry is committed when a majority acknowledge it.\n- **Term tracking**: Each node tracks the current term. Votes are granted only once per term.\n\nGiven a sequence of events (timeouts, client requests, message deliveries, network partitions), simulate the system and return the final state of each node: `{state, term, commitIndex, log}`.\n\nStates: `"follower"`, `"candidate"`, `"leader"`.\n\nProcess events in order.',
ARRAY['3 <= n <= 7 (must be odd)', '1 <= events.length <= 200'],
'{"javascript": "function raftSimulation(n, events) {\n  // your code here\n}", "python": "def raft_simulation(n, events):\n    pass"}',
'{"public": [{"input": {"n": 3, "events": [{"type": "timeout", "node": 0}, {"type": "vote_response", "from": 1, "to": 0, "granted": true}, {"type": "client_request", "node": 0, "value": "x"}]}, "expected": [{"state": "leader", "term": 1, "commitIndex": -1, "log": [{"term": 1, "value": "x"}]}, {"state": "follower", "term": 1, "commitIndex": -1, "log": []}, {"state": "follower", "term": 0, "commitIndex": -1, "log": []}]}], "hidden": [{"input": {"n": 3, "events": [{"type": "timeout", "node": 0}, {"type": "timeout", "node": 1}]}, "expected": "__validator__raft"}]}',
ARRAY['simulation', 'design']),

-- 18
('c1000000-0000-0000-0000-000000000018', 'Hungarian Algorithm', 'hard',
E'Implement the Hungarian algorithm to solve the assignment problem.\n\nGiven an `n x n` cost matrix, find a one-to-one assignment of workers to jobs that minimizes the total cost.\n\nReturn an object with:\n- `totalCost`: the minimum total cost\n- `assignment`: an array where `assignment[i]` is the job assigned to worker `i`\n\nThe algorithm should run in O(n^3) time.',
ARRAY['1 <= n <= 200', '0 <= cost[i][j] <= 10^6'],
'{"javascript": "function hungarian(cost) {\n  // your code here\n}", "python": "def hungarian(cost):\n    pass"}',
'{"public": [{"input": {"cost": [[9,2,7,8],[6,4,3,7],[5,8,1,8],[7,6,9,4]]}, "expected": {"totalCost": 13, "assignment": [1,0,2,3]}}, {"input": {"cost": [[1,2],[3,4]]}, "expected": {"totalCost": 5, "assignment": [0,1]}}], "hidden": [{"input": {"cost": [[5]]}, "expected": {"totalCost": 5, "assignment": [0]}}, {"input": {"cost": [[10,5,3],[2,8,7],[6,4,9]]}, "expected": {"totalCost": 14, "assignment": [2,0,1]}}, {"input": {"cost": [[0,0,0],[0,0,0],[0,0,0]]}, "expected": {"totalCost": 0, "assignment": [0,1,2]}}]}',
ARRAY['math', 'graphs', 'dynamic-programming']),

-- 19
('c1000000-0000-0000-0000-000000000019', 'Wavelet Tree', 'hard',
E'Implement a Wavelet Tree over an array of integers to answer the following queries efficiently:\n\n- `rank(value, pos)`: Count occurrences of `value` in `arr[0..pos]` (inclusive).\n- `select(value, k)`: Find the index of the k-th occurrence (1-indexed) of `value` in the array, or -1 if fewer than k occurrences exist.\n- `quantile(left, right, k)`: Find the k-th smallest element (1-indexed) in the subarray `arr[left..right]`.\n- `count(left, right, lo, hi)`: Count elements in `arr[left..right]` whose values are in `[lo, hi]`.\n\nProcess operations and return results.',
ARRAY['1 <= arr.length <= 10^4', '0 <= arr[i] <= 10^5', '1 <= operations.length <= 10^4'],
'{"javascript": "function waveletTree(arr, operations) {\n  // your code here\n}", "python": "def wavelet_tree(arr, operations):\n    pass"}',
'{"public": [{"input": {"arr": [3, 1, 4, 1, 5, 9, 2, 6], "operations": [["rank", 1, 4], ["select", 1, 2], ["quantile", 0, 7, 3], ["count", 0, 7, 2, 5]]}, "expected": [2, 3, 3, 4]}], "hidden": [{"input": {"arr": [5, 5, 5], "operations": [["rank", 5, 2], ["select", 5, 3], ["quantile", 0, 2, 2]]}, "expected": [3, 2, 5]}, {"input": {"arr": [1, 2, 3, 4, 5], "operations": [["count", 0, 4, 1, 5], ["count", 1, 3, 2, 3]]}, "expected": [5, 2]}]}',
ARRAY['trees', 'design', 'bit-manipulation']),

-- 20
('c1000000-0000-0000-0000-000000000020', 'Palindromic Tree (Eertree)', 'hard',
E'Build an Eertree (palindromic tree) for a given string.\n\nAn Eertree is a data structure that contains all distinct palindromic substrings of a string.\n\nGiven a string `s`, build the eertree and answer:\n\n- `count`: Total number of distinct palindromic substrings.\n- `longest`: The longest palindromic substring. If there are ties, return the lexicographically smallest.\n- `frequency(p)`: How many times palindrome `p` occurs as a substring.\n\nProcess queries and return results.',
ARRAY['1 <= s.length <= 10^4', 's consists of lowercase English letters.', '1 <= queries.length <= 1000'],
'{"javascript": "function eertree(s, queries) {\n  // your code here\n}", "python": "def eertree(s, queries):\n    pass"}',
'{"public": [{"input": {"s": "abacaba", "queries": [["count"], ["longest"], ["frequency", "aba"]]}, "expected": [7, "abacaba", 2]}], "hidden": [{"input": {"s": "aaa", "queries": [["count"], ["longest"], ["frequency", "a"], ["frequency", "aa"]]}, "expected": [3, "aaa", 3, 2]}, {"input": {"s": "abc", "queries": [["count"], ["longest"]]}, "expected": [3, "a"]}]}',
ARRAY['strings', 'trees', 'design']),

-- 21
('c1000000-0000-0000-0000-000000000021', 'Dominator Tree', 'hard',
E'Given a directed graph with a designated entry node, compute the dominator tree.\n\nNode A dominates node B if every path from the entry to B must pass through A. The immediate dominator of B is the closest strict dominator.\n\nImplement the Lengauer-Tarjan algorithm or an equivalent O(n * alpha(n)) approach.\n\nReturn the immediate dominator of each node (the entry node''s immediate dominator is itself or -1).',
ARRAY['1 <= n <= 10^4', '0 <= edges.length <= 10^4', 'Nodes are 0-indexed.', 'Entry node is 0.'],
'{"javascript": "function dominatorTree(n, edges) {\n  // your code here\n}", "python": "def dominator_tree(n, edges):\n    pass"}',
'{"public": [{"input": {"n": 6, "edges": [[0,1],[0,2],[1,3],[2,3],[3,4],[1,5],[2,5]]}, "expected": [-1, 0, 0, 0, 3, 0]}], "hidden": [{"input": {"n": 4, "edges": [[0,1],[0,2],[1,3],[2,3]]}, "expected": [-1, 0, 0, 0]}, {"input": {"n": 2, "edges": [[0,1]]}, "expected": [-1, 0]}, {"input": {"n": 1, "edges": []}, "expected": [-1]}]}',
ARRAY['graphs', 'trees', 'dfs']),

-- 22
('c1000000-0000-0000-0000-000000000022', 'Z-Buffer Renderer', 'hard',
E'Implement a simple 3D triangle rasterizer with z-buffering.\n\nGiven a list of 3D triangles (each with 3 vertices `[x, y, z]` and a color), rasterize them onto a `width x height` pixel grid.\n\nFor each pixel:\n1. Determine if the pixel center lies inside the triangle''s 2D projection (ignoring z).\n2. If inside, interpolate the z-value using barycentric coordinates.\n3. Use the z-buffer to determine visibility (smaller z = closer to camera).\n\nReturn the final framebuffer as a 2D array of color values. Pixels not covered by any triangle should have color `0`.\n\nUse top-left fill convention for edge cases.',
ARRAY['1 <= width, height <= 200', '1 <= triangles.length <= 100', 'Coordinates are floating-point numbers.'],
'{"javascript": "function rasterize(width, height, triangles) {\n  // your code here\n}", "python": "def rasterize(width, height, triangles):\n    pass"}',
'{"public": [{"input": {"width": 5, "height": 5, "triangles": [{"vertices": [[0,0,1],[4,0,1],[2,4,1]], "color": 1}]}, "expected": [[0,0,1,0,0],[0,1,1,1,0],[0,1,1,1,0],[1,1,1,1,1],[0,0,0,0,0]]}], "hidden": [{"input": {"width": 3, "height": 3, "triangles": [{"vertices": [[0,0,2],[2,0,2],[1,2,2]], "color": 1}, {"vertices": [[0,0,1],[2,0,1],[1,2,1]], "color": 2}]}, "expected": [[0,2,0],[2,2,2],[0,0,0]]}]}',
ARRAY['math', 'matrix', 'simulation']),

-- 23
('c1000000-0000-0000-0000-000000000023', 'Interval Scheduling with Weighted Jobs', 'hard',
E'Given `n` weighted jobs, each with a start time, end time, and profit, find the maximum profit subset of non-overlapping jobs.\n\nTwo jobs overlap if one starts before the other ends (strictly).\n\nReturn an object with:\n- `maxProfit`: the maximum achievable profit\n- `selectedJobs`: indices (0-based) of the selected jobs, sorted in ascending order\n\nUse dynamic programming with binary search for O(n log n) solution.',
ARRAY['1 <= jobs.length <= 10^4', 'Start times, end times are non-negative integers.', 'start < end for each job.', 'Profits are positive integers.'],
'{"javascript": "function weightedJobScheduling(jobs) {\n  // your code here\n}", "python": "def weighted_job_scheduling(jobs):\n    pass"}',
'{"public": [{"input": {"jobs": [{"start":1,"end":3,"profit":50},{"start":2,"end":5,"profit":20},{"start":4,"end":6,"profit":30},{"start":6,"end":8,"profit":60}]}, "expected": {"maxProfit": 140, "selectedJobs": [0, 2, 3]}}], "hidden": [{"input": {"jobs": [{"start":0,"end":10,"profit":100},{"start":0,"end":3,"profit":40},{"start":3,"end":6,"profit":40},{"start":6,"end":10,"profit":40}]}, "expected": {"maxProfit": 120, "selectedJobs": [1, 2, 3]}}, {"input": {"jobs": [{"start":0,"end":1,"profit":5}]}, "expected": {"maxProfit": 5, "selectedJobs": [0]}}]}',
ARRAY['dynamic-programming', 'binary-search', 'sorting']),

-- 24
('c1000000-0000-0000-0000-000000000024', 'Regex to NFA to DFA Conversion', 'hard',
E'Given a simple regular expression, convert it to an NFA using Thompson''s construction, then convert the NFA to a DFA using the subset construction.\n\nSupported regex operators:\n- Concatenation (implicit, e.g., `ab`)\n- Alternation `|`\n- Kleene star `*`\n- Parentheses for grouping\n- Literal characters a-z\n\nReturn the DFA as:\n- `states`: number of states\n- `transitions`: object mapping `"state,char"` to next state\n- `startState`: the start state (0)\n- `acceptStates`: array of accepting states\n\nAlso, given test strings, return whether each is accepted by the DFA.',
ARRAY['1 <= regex.length <= 50', 'Regex uses only a-z, |, *, (, )'],
'{"javascript": "function regexToDFA(regex, testStrings) {\n  // your code here\n}", "python": "def regex_to_dfa(regex, test_strings):\n    pass"}',
'{"public": [{"input": {"regex": "a(b|c)*", "testStrings": ["a", "abc", "abcbc", "ab", "d", ""]}, "expected": [true, true, true, true, false, false]}], "hidden": [{"input": {"regex": "(a|b)*abb", "testStrings": ["abb", "aabb", "babb", "ab", ""]}, "expected": [true, true, true, false, false]}, {"input": {"regex": "a*", "testStrings": ["", "a", "aaa", "b"]}, "expected": [true, true, true, false]}]}',
ARRAY['graphs', 'parsing', 'design']),

-- 25
('c1000000-0000-0000-0000-000000000025', 'Gomoku AI with Alpha-Beta Pruning', 'hard',
E'Implement a Gomoku (Five in a Row) AI that uses minimax with alpha-beta pruning.\n\nGomoku is played on a 15x15 board. Two players alternate placing stones. The first to get 5 in a row (horizontal, vertical, or diagonal) wins.\n\nGiven a board state and which player''s turn it is, return the best move `[row, col]`.\n\nYour AI should:\n- Search at least 3 plies deep.\n- Use alpha-beta pruning to reduce the search space.\n- Use a reasonable evaluation function that considers: threats (open/closed 2/3/4 in a row), center proximity, and board control.\n\nThe board is a 2D array: 0=empty, 1=player1, 2=player2.',
ARRAY['Board is 15x15.', 'At least one empty cell exists.'],
'{"javascript": "function gomokuAI(board, player) {\n  // your code here\n}", "python": "def gomoku_ai(board, player):\n    pass"}',
'{"public": [{"input": {"board": "__15x15_almost_win__", "player": 1}, "expected": "__validator__gomoku_win"}, {"input": {"board": "__15x15_block_needed__", "player": 2}, "expected": "__validator__gomoku_block"}], "hidden": [{"input": {"board": "__15x15_empty_center__", "player": 1}, "expected": "__validator__gomoku_valid"}, {"input": {"board": "__15x15_complex__", "player": 1}, "expected": "__validator__gomoku_valid"}]}',
ARRAY['backtracking', 'simulation', 'math']),

-- 26
('c1000000-0000-0000-0000-000000000026', 'B-Tree Insert and Delete', 'hard',
E'Implement a B-tree of minimum degree `t` with insert and delete operations.\n\nA B-tree of minimum degree `t`:\n- Every node has at most `2t - 1` keys.\n- Every non-root node has at least `t - 1` keys.\n- All leaves are at the same level.\n\nOperations:\n- `insert(key)`: Insert a key.\n- `delete(key)`: Delete a key. Handle all cases: leaf deletion, internal node deletion with predecessor/successor replacement, and borrowing/merging.\n- `search(key)`: Return true if key exists.\n- `inorder()`: Return all keys in sorted order.\n\nProcess operations and return results of search and inorder operations.',
ARRAY['2 <= t <= 5', '1 <= operations.length <= 1000', 'Keys are integers.'],
'{"javascript": "function bTreeOps(t, operations) {\n  // your code here\n}", "python": "def b_tree_ops(t, operations):\n    pass"}',
'{"public": [{"input": {"t": 2, "operations": [["insert", 10], ["insert", 20], ["insert", 5], ["insert", 6], ["insert", 12], ["inorder"], ["delete", 6], ["inorder"], ["search", 6], ["search", 10]]}, "expected": [[5,6,10,12,20], [5,10,12,20], false, true]}], "hidden": [{"input": {"t": 3, "operations": [["insert", 1], ["insert", 2], ["insert", 3], ["insert", 4], ["insert", 5], ["insert", 6], ["insert", 7], ["insert", 8], ["insert", 9], ["insert", 10], ["inorder"], ["delete", 5], ["delete", 3], ["inorder"]]}, "expected": [[1,2,3,4,5,6,7,8,9,10], [1,2,4,6,7,8,9,10]]}, {"input": {"t": 2, "operations": [["insert", 1], ["delete", 1], ["inorder"], ["search", 1]]}, "expected": [[], false]}]}',
ARRAY['trees', 'design']),

-- 27
('c1000000-0000-0000-0000-000000000027', 'Fenwick Tree 2D (Range Updates)', 'hard',
E'Implement a 2D Fenwick tree (Binary Indexed Tree) that supports:\n\n- `update(r1, c1, r2, c2, val)`: Add `val` to all elements in the rectangle from `(r1, c1)` to `(r2, c2)` inclusive.\n- `query(r, c)`: Return the value at position `(r, c)` after all updates.\n- `rangeQuery(r1, c1, r2, c2)`: Return the sum of all elements in the rectangle `(r1, c1)` to `(r2, c2)`.\n\nThe grid starts as all zeros with dimensions `rows x cols`.\n\nProcess operations and return results of query and rangeQuery operations.',
ARRAY['1 <= rows, cols <= 500', '1 <= operations.length <= 10^4', 'Values fit in 64-bit integers.'],
'{"javascript": "function fenwick2D(rows, cols, operations) {\n  // your code here\n}", "python": "def fenwick_2d(rows, cols, operations):\n    pass"}',
'{"public": [{"input": {"rows": 4, "cols": 4, "operations": [["update", 0, 0, 2, 2, 1], ["query", 1, 1], ["rangeQuery", 0, 0, 3, 3], ["update", 1, 1, 3, 3, 2], ["rangeQuery", 0, 0, 3, 3]]}, "expected": [1, 9, 27]}], "hidden": [{"input": {"rows": 2, "cols": 2, "operations": [["update", 0, 0, 1, 1, 5], ["query", 0, 0], ["query", 1, 1], ["rangeQuery", 0, 0, 1, 1]]}, "expected": [5, 5, 20]}, {"input": {"rows": 1, "cols": 1, "operations": [["update", 0, 0, 0, 0, 3], ["query", 0, 0]]}, "expected": [3]}]}',
ARRAY['trees', 'design', 'matrix']),

-- 28
('c1000000-0000-0000-0000-000000000028', 'Link-Cut Trees', 'hard',
E'Implement a Link-Cut Tree that supports the following operations on a forest:\n\n- `link(u, v)`: Make node `u` a child of node `v`. Assumes they are in different trees.\n- `cut(u)`: Remove the edge between node `u` and its parent.\n- `connected(u, v)`: Return true if `u` and `v` are in the same tree.\n- `lca(u, v)`: Return the Lowest Common Ancestor of `u` and `v` if they are in the same tree, or -1 otherwise.\n- `pathAggregate(u, v)`: Return the sum of values on the path from `u` to `v`, or -1 if not connected.\n\nEach node has an initial value.\n\nProcess operations and return results of query operations.',
ARRAY['1 <= n <= 10^4', '1 <= operations.length <= 10^4'],
'{"javascript": "function linkCutTree(n, values, operations) {\n  // your code here\n}", "python": "def link_cut_tree(n, values, operations):\n    pass"}',
'{"public": [{"input": {"n": 5, "values": [1,2,3,4,5], "operations": [["link", 1, 0], ["link", 2, 0], ["connected", 1, 2], ["pathAggregate", 1, 2], ["cut", 2], ["connected", 1, 2]]}, "expected": [true, 6, false]}], "hidden": [{"input": {"n": 3, "values": [10, 20, 30], "operations": [["connected", 0, 1], ["link", 1, 0], ["link", 2, 1], ["pathAggregate", 0, 2], ["lca", 0, 2]]}, "expected": [false, 60, 0]}, {"input": {"n": 1, "values": [5], "operations": [["pathAggregate", 0, 0]]}, "expected": [5]}]}',
ARRAY['trees', 'design']),

-- 29
('c1000000-0000-0000-0000-000000000029', 'Hopcroft-Karp Bipartite Matching', 'hard',
E'Implement the Hopcroft-Karp algorithm for maximum bipartite matching.\n\nGiven a bipartite graph with `n` nodes on the left side and `m` nodes on the right side, and a list of edges between them, find the maximum matching.\n\nThe Hopcroft-Karp algorithm runs in O(E * sqrt(V)) time:\n1. Use BFS to find shortest augmenting paths.\n2. Use DFS to find vertex-disjoint augmenting paths along the shortest paths.\n3. Repeat until no augmenting path exists.\n\nReturn an object with:\n- `matchingSize`: the size of the maximum matching\n- `matching`: array of pairs `[left, right]` in the matching, sorted by left node',
ARRAY['1 <= n, m <= 1000', '0 <= edges.length <= 10^4'],
'{"javascript": "function hopcroftKarp(n, m, edges) {\n  // your code here\n}", "python": "def hopcroft_karp(n, m, edges):\n    pass"}',
'{"public": [{"input": {"n": 3, "m": 3, "edges": [[0,0],[0,1],[1,0],[1,1],[2,2]]}, "expected": {"matchingSize": 3, "matching": [[0,1],[1,0],[2,2]]}}, {"input": {"n": 2, "m": 2, "edges": [[0,0],[1,0]]}, "expected": {"matchingSize": 1, "matching": [[0,0]]}}], "hidden": [{"input": {"n": 4, "m": 4, "edges": [[0,0],[0,1],[1,0],[1,1],[2,2],[2,3],[3,2],[3,3]]}, "expected": {"matchingSize": 4, "matching": [[0,1],[1,0],[2,3],[3,2]]}}, {"input": {"n": 1, "m": 1, "edges": []}, "expected": {"matchingSize": 0, "matching": []}}]}',
ARRAY['graphs', 'bfs', 'dfs']),

-- 30
('c1000000-0000-0000-0000-000000000030', 'Pollard''s Rho Factorization', 'hard',
E'Implement Pollard''s Rho algorithm for integer factorization.\n\nGiven a large composite number `n`, find its complete prime factorization.\n\nThe algorithm:\n1. Use a pseudo-random function `f(x) = (x^2 + c) mod n`.\n2. Use Floyd''s cycle detection (tortoise and hare) to find a factor.\n3. Check if the factor is prime; if not, recurse.\n4. Use Miller-Rabin primality test for checking primality.\n\nFor deterministic results, use `c = 1` initially, incrementing if the algorithm fails to find a factor.\n\nReturn the prime factors as a sorted array (with repetitions for prime powers).\n\nFor small numbers (< 1000), you may use trial division instead.',
ARRAY['2 <= n <= 10^15'],
'{"javascript": "function factorize(n) {\n  // your code here\n}", "python": "def factorize(n):\n    pass"}',
'{"public": [{"input": {"n": 1000000007}, "expected": [1000000007]}, {"input": {"n": 12}, "expected": [2, 2, 3]}], "hidden": [{"input": {"n": 2}, "expected": [2]}, {"input": {"n": 100}, "expected": [2, 2, 5, 5]}, {"input": {"n": 1000000006}, "expected": [2, 500000003]}, {"input": {"n": 999999999999989}, "expected": [999999999999989]}, {"input": {"n": 1234567890}, "expected": [2, 3, 3, 5, 3607, 3803]}]}',
ARRAY['math', 'recursion']),

-- 31
('c1000000-0000-0000-0000-000000000031', 'Implicit Treap (Order Statistics)', 'hard',
E'Implement an implicit treap (cartesian tree with implicit keys) to support array operations:\n\n- `insert(pos, val)`: Insert value at position pos.\n- `delete(pos)`: Delete element at position pos.\n- `reverse(left, right)`: Reverse the subarray [left, right] (0-indexed).\n- `sum(left, right)`: Return sum of elements in [left, right].\n- `get(pos)`: Return element at position pos.\n- `toArray()`: Return the full array.\n\nAll operations should work in O(log n) expected time (except toArray).\n\nFor deterministic behavior, use `priority = hash(val + pos * 1000003)` where hash is a simple polynomial hash.\n\nProcess operations and return results of query operations.',
ARRAY['1 <= operations.length <= 10^4', 'Values are integers.'],
'{"javascript": "function implicitTreap(operations) {\n  // your code here\n}", "python": "def implicit_treap(operations):\n    pass"}',
'{"public": [{"input": {"operations": [["insert", 0, 1], ["insert", 1, 2], ["insert", 2, 3], ["insert", 3, 4], ["insert", 4, 5], ["toArray"], ["reverse", 1, 3], ["toArray"], ["sum", 0, 4]]}, "expected": [[1,2,3,4,5], [1,4,3,2,5], 15]}], "hidden": [{"input": {"operations": [["insert", 0, 10], ["insert", 0, 20], ["toArray"], ["delete", 0], ["toArray"], ["get", 0]]}, "expected": [[20,10], [10], 10]}, {"input": {"operations": [["insert", 0, 5], ["sum", 0, 0]]}, "expected": [5]}]}',
ARRAY['trees', 'design', 'arrays']),

-- 32
('c1000000-0000-0000-0000-000000000032', 'CYK Parser', 'hard',
E'Implement the CYK (Cocke-Younger-Kasami) parsing algorithm for context-free grammars in Chomsky Normal Form.\n\nGiven a grammar in CNF (every production is either `A -> BC` or `A -> a`) and an input string, determine:\n\n1. Whether the string can be generated by the grammar.\n2. If yes, return a parse tree. If multiple parse trees exist, return any one.\n\nThe parse tree is a nested structure: `{symbol, children}` for non-terminals and `{symbol, value}` for terminals.\n\nThe start symbol is always `"S"``.',
ARRAY['1 <= rules.length <= 100', '1 <= input.length <= 50', 'Grammar is in Chomsky Normal Form.'],
'{"javascript": "function cykParse(rules, input) {\n  // your code here\n}", "python": "def cyk_parse(rules, input_str):\n    pass"}',
'{"public": [{"input": {"rules": [{"lhs":"S","rhs":["A","B"]},{"lhs":"A","rhs":["a"]},{"lhs":"B","rhs":["b"]}], "input": "ab"}, "expected": {"accepted": true, "tree": {"symbol":"S","children":[{"symbol":"A","children":[{"symbol":"a","value":"a"}]},{"symbol":"B","children":[{"symbol":"b","value":"b"}]}]}}}], "hidden": [{"input": {"rules": [{"lhs":"S","rhs":["A","B"]},{"lhs":"S","rhs":["B","C"]},{"lhs":"A","rhs":["B","A"]},{"lhs":"A","rhs":["a"]},{"lhs":"B","rhs":["C","C"]},{"lhs":"B","rhs":["b"]},{"lhs":"C","rhs":["A","B"]},{"lhs":"C","rhs":["a"]}], "input": "baaba"}, "expected": {"accepted": true, "tree": "__validator__cyk"}}, {"input": {"rules": [{"lhs":"S","rhs":["a"]}], "input": "b"}, "expected": {"accepted": false, "tree": null}}]}',
ARRAY['parsing', 'dynamic-programming', 'trees']),

-- 33
('c1000000-0000-0000-0000-000000000033', 'Edmonds'' Blossom Algorithm', 'hard',
E'Implement Edmonds'' Blossom algorithm for maximum matching in general (non-bipartite) graphs.\n\nUnlike bipartite matching, general graphs can contain odd cycles (blossoms) that must be contracted to find augmenting paths.\n\nGiven an undirected graph with `n` nodes and a list of edges, find the maximum matching.\n\nReturn:\n- `matchingSize`: number of matched pairs\n- `matching`: array of pairs `[u, v]` where `u < v`, sorted by first element',
ARRAY['1 <= n <= 200', '0 <= edges.length <= n*(n-1)/2', 'No self-loops or duplicate edges.'],
'{"javascript": "function blossomMatching(n, edges) {\n  // your code here\n}", "python": "def blossom_matching(n, edges):\n    pass"}',
'{"public": [{"input": {"n": 4, "edges": [[0,1],[1,2],[2,3],[3,0]]}, "expected": {"matchingSize": 2, "matching": [[0,1],[2,3]]}}, {"input": {"n": 5, "edges": [[0,1],[1,2],[2,0],[2,3],[3,4]]}, "expected": {"matchingSize": 2, "matching": [[0,1],[3,4]]}}], "hidden": [{"input": {"n": 3, "edges": [[0,1],[1,2],[0,2]]}, "expected": {"matchingSize": 1, "matching": "__validator__matching"}}, {"input": {"n": 6, "edges": [[0,1],[1,2],[2,3],[3,4],[4,5],[5,0]]}, "expected": {"matchingSize": 3, "matching": [[0,1],[2,3],[4,5]]}}, {"input": {"n": 1, "edges": []}, "expected": {"matchingSize": 0, "matching": []}}]}',
ARRAY['graphs', 'bfs']),

-- 34
('c1000000-0000-0000-0000-000000000034', 'Compiler: Three-Address Code Generator', 'hard',
E'Given a simple imperative program as an AST, generate three-address code (TAC) / intermediate representation.\n\nThe AST supports:\n- Variable declarations and assignments\n- Arithmetic expressions (`+`, `-`, `*`, `/`)\n- If/else statements\n- While loops\n- Boolean conditions (`<`, `>`, `<=`, `>=`, `==`, `!=`, `&&`, `||`, `!`)\n\nGenerate TAC instructions:\n- `t1 = a + b` (binary ops)\n- `t1 = -a` (unary ops)\n- `if t1 goto L1` (conditional jump)\n- `goto L1` (unconditional jump)\n- `L1:` (label)\n- `x = t1` (assignment)\n\nUse temporary variables `t1, t2, ...` and labels `L1, L2, ...`.\n\nReturn the array of TAC instruction strings.',
ARRAY['AST nesting depth <= 20.', 'Variable names are lowercase letters.'],
'{"javascript": "function generateTAC(ast) {\n  // your code here\n}", "python": "def generate_tac(ast):\n    pass"}',
'{"public": [{"input": {"ast": {"type": "assign", "target": "x", "value": {"type": "binop", "op": "+", "left": {"type": "var", "name": "a"}, "right": {"type": "num", "value": 1}}}}, "expected": ["t1 = a + 1", "x = t1"]}, {"input": {"ast": {"type": "if", "condition": {"type": "binop", "op": ">", "left": {"type": "var", "name": "x"}, "right": {"type": "num", "value": 0}}, "then": {"type": "assign", "target": "y", "value": {"type": "num", "value": 1}}, "else": {"type": "assign", "target": "y", "value": {"type": "num", "value": 0}}}}, "expected": ["t1 = x > 0", "if t1 goto L1", "y = 0", "goto L2", "L1:", "y = 1", "L2:"]}], "hidden": [{"input": {"ast": {"type": "while", "condition": {"type": "binop", "op": "<", "left": {"type": "var", "name": "i"}, "right": {"type": "num", "value": 10}}, "body": {"type": "assign", "target": "i", "value": {"type": "binop", "op": "+", "left": {"type": "var", "name": "i"}, "right": {"type": "num", "value": 1}}}}}, "expected": ["L1:", "t1 = i < 10", "if t1 goto L2", "goto L3", "L2:", "t2 = i + 1", "i = t2", "goto L1", "L3:"]}]}',
ARRAY['parsing', 'recursion', 'design']),

-- 35
('c1000000-0000-0000-0000-000000000035', 'Suffix Tree Construction (Ukkonen)', 'hard',
E'Implement Ukkonen''s algorithm for online suffix tree construction in O(n) time.\n\nGiven a string `s`, build the suffix tree and answer queries:\n\n- `search(pattern)`: Return true if pattern exists as a substring.\n- `count(pattern)`: Return the number of occurrences.\n- `longestRepeatedSubstring()`: Return the longest substring that appears at least twice.\n- `shortestUniqueSubstring(pos)`: Return the shortest substring starting at position `pos` that doesn''t appear anywhere else in `s`.\n\nAppend a terminal character `$` to handle edge cases.',
ARRAY['1 <= s.length <= 10^4', 's consists of lowercase English letters.'],
'{"javascript": "function suffixTreeOps(s, queries) {\n  // your code here\n}", "python": "def suffix_tree_ops(s, queries):\n    pass"}',
'{"public": [{"input": {"s": "banana", "queries": [["search", "ana"], ["count", "ana"], ["longestRepeatedSubstring"]]}, "expected": [true, 2, "ana"]}], "hidden": [{"input": {"s": "abcabc", "queries": [["search", "cab"], ["count", "abc"], ["longestRepeatedSubstring"]]}, "expected": [true, 2, "abc"]}, {"input": {"s": "abcd", "queries": [["longestRepeatedSubstring"], ["search", "abcde"]]}, "expected": ["", false]}, {"input": {"s": "aaa", "queries": [["count", "a"], ["count", "aa"], ["longestRepeatedSubstring"]]}, "expected": [3, 2, "aa"]}]}',
ARRAY['strings', 'trees', 'design']),

-- 36
('c1000000-0000-0000-0000-000000000036', 'Gauss-Jordan Elimination over GF(2)', 'hard',
E'Implement Gauss-Jordan elimination over GF(2) (the Galois field with elements {0, 1}).\n\nGiven a system of linear equations over GF(2) (where addition = XOR, multiplication = AND), determine:\n\n1. Whether the system has a solution.\n2. If it does, find one solution and the dimension of the solution space (number of free variables).\n3. If requested, enumerate all solutions (up to a reasonable limit).\n\nInput: a matrix `A` and vector `b` where `Ax = b (mod 2)`.\n\nReturn:\n- `solvable`: boolean\n- `solution`: one solution vector (or null)\n- `freeVars`: number of free variables\n- `allSolutions`: all solution vectors (only if freeVars <= 10)',
ARRAY['1 <= rows <= 100', '1 <= cols <= 30', 'Matrix values are 0 or 1.'],
'{"javascript": "function gf2Solve(A, b) {\n  // your code here\n}", "python": "def gf2_solve(A, b):\n    pass"}',
'{"public": [{"input": {"A": [[1,0,1],[0,1,1],[1,1,0]], "b": [1,0,1]}, "expected": {"solvable": true, "solution": [1,0,0], "freeVars": 0, "allSolutions": [[1,0,0]]}}], "hidden": [{"input": {"A": [[1,1],[1,1]], "b": [1,0]}, "expected": {"solvable": false, "solution": null, "freeVars": 0, "allSolutions": []}}, {"input": {"A": [[1,1,0],[0,1,1]], "b": [1,1]}, "expected": {"solvable": true, "solution": "__validator__gf2", "freeVars": 1, "allSolutions": "__validator__gf2_all"}}]}',
ARRAY['math', 'matrix', 'bit-manipulation']),

-- 37
('c1000000-0000-0000-0000-000000000037', 'Minimum Steiner Tree in Graph', 'hard',
E'Given an undirected weighted graph and a set of terminal nodes, find the minimum weight Steiner tree - a tree that spans all terminal nodes (and may include additional non-terminal nodes) with minimum total edge weight.\n\nThis is NP-hard in general, but for small numbers of terminals, use the Dreyfus-Wagner DP algorithm:\n\n`dp[S][v]` = minimum cost to connect all terminals in subset `S` that includes node `v`.\n\nReturn the total weight of the minimum Steiner tree.',
ARRAY['1 <= n <= 100', '1 <= edges.length <= n*(n-1)/2', '2 <= terminals.length <= 10', 'Edge weights are positive integers.'],
'{"javascript": "function steinerTree(n, edges, terminals) {\n  // your code here\n}", "python": "def steiner_tree(n, edges, terminals):\n    pass"}',
'{"public": [{"input": {"n": 5, "edges": [[0,1,1],[1,2,2],[0,3,3],[3,4,1],[2,4,4]], "terminals": [0, 2, 4]}, "expected": 6}], "hidden": [{"input": {"n": 4, "edges": [[0,1,1],[1,2,1],[2,3,1],[0,3,3]], "terminals": [0, 3]}, "expected": 3}, {"input": {"n": 3, "edges": [[0,1,10],[1,2,10],[0,2,15]], "terminals": [0, 1, 2]}, "expected": 20}, {"input": {"n": 2, "edges": [[0,1,5]], "terminals": [0, 1]}, "expected": 5}]}',
ARRAY['graphs', 'dynamic-programming', 'bit-manipulation']),

-- 38
('c1000000-0000-0000-0000-000000000038', 'FFT Polynomial Multiplication', 'hard',
E'Implement polynomial multiplication using the Fast Fourier Transform (FFT).\n\nGiven two polynomials represented as arrays of coefficients (index = power), multiply them using FFT in O(n log n) time.\n\nAlgorithm:\n1. Pad both polynomials to the next power of 2 (that fits the result).\n2. Apply FFT to convert both to point-value representation.\n3. Multiply point-wise.\n4. Apply inverse FFT to convert back to coefficient representation.\n5. Round the results to the nearest integer.\n\nReturn the product polynomial as an array of integer coefficients (trimming trailing zeros).',
ARRAY['1 <= a.length, b.length <= 10^5', 'Coefficients are integers in [-1000, 1000].'],
'{"javascript": "function polyMultiply(a, b) {\n  // your code here\n}", "python": "def poly_multiply(a, b):\n    pass"}',
'{"public": [{"input": {"a": [1, 2, 3], "b": [4, 5]}, "expected": [4, 13, 22, 15]}, {"input": {"a": [1, 1], "b": [1, 1]}, "expected": [1, 2, 1]}], "hidden": [{"input": {"a": [5], "b": [3]}, "expected": [15]}, {"input": {"a": [1, 0, 0, 1], "b": [1, 1]}, "expected": [1, 1, 0, 1, 1]}, {"input": {"a": [1, -1], "b": [1, 1]}, "expected": [1, 0, -1]}]}',
ARRAY['math', 'arrays']),

-- 39
('c1000000-0000-0000-0000-000000000039', 'Voronoi Diagram (Fortune''s Algorithm)', 'hard',
E'Implement Fortune''s sweep line algorithm to compute the Voronoi diagram for a set of 2D points.\n\nReturn the Voronoi diagram as:\n- `vertices`: array of `[x, y]` coordinates of Voronoi vertices (intersection points of edges), rounded to 4 decimal places.\n- `edges`: array of `{start, end, leftSite, rightSite}` where start/end are indices into the vertices array (or -1 for infinite edges), and leftSite/rightSite are indices into the input points.\n\nThe diagram should be clipped to a bounding box `[xmin, ymin, xmax, ymax]`.\n\nSort vertices by x then y. Sort edges by leftSite then rightSite.',
ARRAY['2 <= points.length <= 1000', 'No three points are collinear.', 'No two points have the same x-coordinate.'],
'{"javascript": "function voronoiDiagram(points, bbox) {\n  // your code here\n}", "python": "def voronoi_diagram(points, bbox):\n    pass"}',
'{"public": [{"input": {"points": [[0,0],[4,0],[2,3]], "bbox": [-1,-1,5,5]}, "expected": "__validator__voronoi"}], "hidden": [{"input": {"points": [[0,0],[2,0],[1,2],[3,2]], "bbox": [-1,-1,4,4]}, "expected": "__validator__voronoi"}, {"input": {"points": [[0,0],[10,0]], "bbox": [-5,-5,15,5]}, "expected": "__validator__voronoi"}]}',
ARRAY['math', 'sorting', 'design']),

-- 40
('c1000000-0000-0000-0000-000000000040', 'Lock-Free Queue Simulation', 'hard',
E'Simulate a lock-free (wait-free) queue using compare-and-swap (CAS) operations in a multi-threaded environment.\n\nGiven a sequence of concurrent operations from multiple threads, simulate the Michael-Scott lock-free queue:\n\n- `enqueue(threadId, value)`: Enqueue a value.\n- `dequeue(threadId)`: Dequeue and return the value, or null if empty.\n\nCAS semantics: `CAS(addr, expected, new)` atomically sets `addr` to `new` if current value equals `expected`, returning success/failure.\n\nOperations are grouped into "steps". Within each step, all operations execute concurrently. Use the provided linearization order (thread IDs in ascending order) to resolve conflicts.\n\nReturn the results of all dequeue operations.',
ARRAY['1 <= threads <= 10', '1 <= steps.length <= 100'],
'{"javascript": "function lockFreeQueue(steps) {\n  // your code here\n}", "python": "def lock_free_queue(steps):\n    pass"}',
'{"public": [{"input": {"steps": [[{"thread":0,"op":"enqueue","value":1},{"thread":1,"op":"enqueue","value":2}],[{"thread":0,"op":"dequeue"},{"thread":1,"op":"dequeue"}]]}, "expected": [1, 2]}], "hidden": [{"input": {"steps": [[{"thread":0,"op":"dequeue"}]]}, "expected": [null]}, {"input": {"steps": [[{"thread":0,"op":"enqueue","value":10}],[{"thread":0,"op":"enqueue","value":20}],[{"thread":1,"op":"dequeue"},{"thread":2,"op":"dequeue"}]]}, "expected": [10, 20]}]}',
ARRAY['design', 'simulation']),

-- 41
('c1000000-0000-0000-0000-000000000041', 'Minimum Cut (Stoer-Wagner)', 'hard',
E'Implement the Stoer-Wagner algorithm to find the minimum cut of an undirected weighted graph.\n\nA minimum cut partitions the vertices into two non-empty sets such that the total weight of edges crossing the partition is minimized.\n\nThe algorithm works by repeatedly performing "minimum cut phases":\n1. Start with an arbitrary vertex.\n2. Greedily add the most tightly connected vertex.\n3. The last two vertices added define a candidate cut.\n4. Merge the last two vertices and repeat.\n\nReturn:\n- `minCutWeight`: the weight of the minimum cut\n- `partition`: one of the two sets (the smaller one), sorted',
ARRAY['2 <= n <= 200', 'Edge weights are positive integers.', 'The graph is connected.'],
'{"javascript": "function stoerWagner(n, edges) {\n  // your code here\n}", "python": "def stoer_wagner(n, edges):\n    pass"}',
'{"public": [{"input": {"n": 4, "edges": [[0,1,2],[1,2,3],[2,3,4],[3,0,5],[0,2,1]]}, "expected": {"minCutWeight": 5, "partition": [1]}}], "hidden": [{"input": {"n": 2, "edges": [[0,1,7]]}, "expected": {"minCutWeight": 7, "partition": [0]}}, {"input": {"n": 6, "edges": [[0,1,1],[1,2,1],[2,3,1],[3,4,1],[4,5,1],[5,0,1],[0,3,10]]}, "expected": {"minCutWeight": 3, "partition": "__validator__mincut"}}]}',
ARRAY['graphs', 'greedy']),

-- 42
('c1000000-0000-0000-0000-000000000042', 'Knuth''s Algorithm for Optimal Alphabetic BST', 'hard',
E'Given a list of keys with frequencies and a list of gap frequencies (for values between and outside keys), construct an optimal alphabetic binary search tree.\n\nUnlike the standard optimal BST, an **alphabetic** BST must maintain the alphabetic order of keys in its inorder traversal (you cannot rearrange keys).\n\nUse the Hu-Tucker algorithm or Knuth''s optimization for O(n^2) solution.\n\nGiven:\n- `keys`: array of n keys with frequencies\n- `gaps`: array of n+1 gap frequencies (for values < first key, between consecutive keys, and > last key)\n\nReturn the minimum expected search cost, computed as:\n`sum(key_freq[i] * depth_of_key[i]) + sum(gap_freq[i] * depth_of_gap[i])`\n\nwhere depths are 1-indexed and gap nodes are at leaf level.',
ARRAY['1 <= n <= 200', 'Frequencies are non-negative integers.'],
'{"javascript": "function optimalAlphabeticBST(keys, gaps) {\n  // your code here\n}", "python": "def optimal_alphabetic_bst(keys, gaps):\n    pass"}',
'{"public": [{"input": {"keys": [{"key":"b","freq":3},{"key":"d","freq":1}], "gaps": [2,1,1]}, "expected": 12}], "hidden": [{"input": {"keys": [{"key":"a","freq":1}], "gaps": [1,1]}, "expected": 5}, {"input": {"keys": [{"key":"a","freq":1},{"key":"b","freq":2},{"key":"c","freq":3}], "gaps": [1,1,1,1]}, "expected": 18}]}',
ARRAY['dynamic-programming', 'trees', 'math']),

-- 43
('c1000000-0000-0000-0000-000000000043', 'Colored Range Queries (Mo''s Algorithm)', 'hard',
E'Implement Mo''s algorithm for offline range queries.\n\nGiven an array of integers and multiple queries of the form `[left, right]`, for each query return the number of **distinct** values in the subarray `arr[left..right]` (inclusive).\n\nMo''s algorithm processes queries in a specific order to minimize total pointer movement:\n1. Divide queries into blocks of size ~sqrt(n).\n2. Sort queries: by block number of left endpoint, breaking ties by right endpoint (alternating direction for odd/even blocks).\n3. Maintain a running answer using add/remove operations.\n\nReturn the answers in the original query order.',
ARRAY['1 <= arr.length <= 10^5', '1 <= queries.length <= 10^5', '0 <= left <= right < arr.length', '0 <= arr[i] <= 10^5'],
'{"javascript": "function mosAlgorithm(arr, queries) {\n  // your code here\n}", "python": "def mos_algorithm(arr, queries):\n    pass"}',
'{"public": [{"input": {"arr": [1,2,1,3,2,1], "queries": [[0,3],[1,4],[2,5]]}, "expected": [3, 3, 3]}, {"input": {"arr": [1,1,1,1], "queries": [[0,3],[1,2]]}, "expected": [1, 1]}], "hidden": [{"input": {"arr": [5], "queries": [[0,0]]}, "expected": [1]}, {"input": {"arr": [1,2,3,4,5], "queries": [[0,4],[0,0],[4,4],[1,3]]}, "expected": [5, 1, 1, 3]}, {"input": {"arr": [1,2,1,2,1], "queries": [[0,1],[0,4],[2,4]]}, "expected": [2, 2, 2]}]}',
ARRAY['arrays', 'sorting', 'math']),

-- 44
('c1000000-0000-0000-0000-000000000044', 'Simplex Method for Linear Programming', 'hard',
E'Implement the Simplex method to solve a linear programming problem.\n\nGiven:\n- A maximization objective: maximize `c^T * x`\n- Subject to constraints: `Ax <= b` and `x >= 0`\n\nWhere `A` is an m x n matrix, `b` is an m-vector, and `c` is an n-vector.\n\nImplement the two-phase simplex method:\n1. Phase 1: Find a basic feasible solution (if one exists).\n2. Phase 2: Optimize the objective function.\n\nReturn:\n- `status`: `"optimal"`, `"infeasible"`, or `"unbounded"`\n- `optimalValue`: the maximum value (null if not optimal)\n- `solution`: the optimal x vector (null if not optimal), rounded to 4 decimal places',
ARRAY['1 <= m, n <= 50', 'All values are real numbers.'],
'{"javascript": "function simplex(A, b, c) {\n  // your code here\n}", "python": "def simplex(A, b, c):\n    pass"}',
'{"public": [{"input": {"A": [[1,1],[2,1],[1,0]], "b": [4,6,3], "c": [3,2]}, "expected": {"status": "optimal", "optimalValue": 11, "solution": [3,1]}}], "hidden": [{"input": {"A": [[1,0],[0,1]], "b": [2,3], "c": [1,1]}, "expected": {"status": "optimal", "optimalValue": 5, "solution": [2, 3]}}, {"input": {"A": [[-1,0],[0,-1]], "b": [-1,-1], "c": [1,1]}, "expected": {"status": "infeasible", "optimalValue": null, "solution": null}}, {"input": {"A": [[1,-1]], "b": [0], "c": [0,1]}, "expected": {"status": "unbounded", "optimalValue": null, "solution": null}}]}',
ARRAY['math', 'matrix']),

-- 45
('c1000000-0000-0000-0000-000000000045', 'Minimal Perfect Hash Function', 'hard',
E'Construct a minimal perfect hash function (MPHF) for a given set of keys.\n\nA perfect hash function maps n keys to n unique integers [0, n). A **minimal** perfect hash has no gaps.\n\nImplement the CHD (Compress, Hash, and Displace) algorithm:\n1. Hash keys into buckets using a primary hash.\n2. Process buckets from largest to smallest.\n3. For each bucket, find a displacement value `d` such that all keys in the bucket map to unique positions.\n\nGiven a set of string keys, return:\n- `displacements`: the array of displacement values per bucket\n- `hashValues`: for each input key (in order), its hash value [0, n)\n\nVerify that all hash values are unique and in [0, n).',
ARRAY['1 <= keys.length <= 10^4', 'All keys are unique strings.', 'Keys consist of lowercase English letters.'],
'{"javascript": "function minimalPerfectHash(keys) {\n  // your code here\n}", "python": "def minimal_perfect_hash(keys):\n    pass"}',
'{"public": [{"input": {"keys": ["apple", "banana", "cherry"]}, "expected": "__validator__mphf"}], "hidden": [{"input": {"keys": ["a", "b", "c", "d", "e"]}, "expected": "__validator__mphf"}, {"input": {"keys": ["x"]}, "expected": "__validator__mphf"}, {"input": {"keys": ["hello", "world", "foo", "bar", "baz", "qux", "quux", "corge", "grault", "garply"]}, "expected": "__validator__mphf"}]}',
ARRAY['hash-map', 'design', 'math']),

-- 46
('c1000000-0000-0000-0000-000000000046', 'Interval Graph Coloring (Chromatic Number)', 'hard',
E'Given a set of intervals, model them as an interval graph (two intervals share an edge if they overlap) and find the chromatic number (minimum number of colors needed).\n\nFor interval graphs, the chromatic number equals the clique number (maximum clique size), which equals the maximum number of intervals that all mutually overlap.\n\nAlso return a valid coloring assignment.\n\nReturn:\n- `chromaticNumber`: the minimum colors needed\n- `coloring`: an array where `coloring[i]` is the color (0-indexed) assigned to interval `i`\n- `maxClique`: indices of intervals forming the maximum clique',
ARRAY['1 <= intervals.length <= 10^4', 'Interval endpoints are integers.'],
'{"javascript": "function intervalColoring(intervals) {\n  // your code here\n}", "python": "def interval_coloring(intervals):\n    pass"}',
'{"public": [{"input": {"intervals": [[1,3],[2,5],[4,7],[6,9]]}, "expected": {"chromaticNumber": 2, "coloring": "__validator__coloring", "maxClique": "__validator__clique"}}], "hidden": [{"input": {"intervals": [[0,10],[1,2],[3,4],[5,6]]}, "expected": {"chromaticNumber": 2, "coloring": "__validator__coloring", "maxClique": "__validator__clique"}}, {"input": {"intervals": [[0,1],[2,3],[4,5]]}, "expected": {"chromaticNumber": 1, "coloring": [0,0,0], "maxClique": "__validator__clique"}}, {"input": {"intervals": [[0,5],[1,6],[2,7],[3,8]]}, "expected": {"chromaticNumber": 4, "coloring": "__validator__coloring", "maxClique": [0,1,2,3]}}]}',
ARRAY['graphs', 'greedy', 'sorting']),

-- 47
('c1000000-0000-0000-0000-000000000047', 'Recursive Descent Parser with Pratt Parsing', 'hard',
E'Implement a Pratt parser (top-down operator precedence parser) for a mathematical expression language that supports:\n\n- Integers and floating-point numbers\n- Binary operators: `+`, `-`, `*`, `/`, `^` (right-assoc), `%`\n- Unary operators: prefix `-`, prefix `+`, postfix `!` (factorial)\n- Parentheses\n- Function calls: `sin(x)`, `cos(x)`, `sqrt(x)`, `abs(x)`, `max(x,y)`, `min(x,y)`\n- Variable names (lowercase letters)\n- Ternary operator: `condition ? then : else`\n\nGiven an expression string and a variable binding map, evaluate the expression and return the result (floating point, rounded to 6 decimal places).\n\nThe ternary condition is truthy if non-zero.',
ARRAY['1 <= expression.length <= 500', 'Expression is syntactically valid.'],
'{"javascript": "function prattEval(expression, variables) {\n  // your code here\n}", "python": "def pratt_eval(expression, variables):\n    pass"}',
'{"public": [{"input": {"expression": "2 + 3 * 4", "variables": {}}, "expected": 14}, {"input": {"expression": "2 ^ 3 ^ 2", "variables": {}}, "expected": 512}], "hidden": [{"input": {"expression": "-5 + 3", "variables": {}}, "expected": -2}, {"input": {"expression": "5!", "variables": {}}, "expected": 120}, {"input": {"expression": "sin(0) + cos(0)", "variables": {}}, "expected": 1}, {"input": {"expression": "x > 0 ? x : -x", "variables": {"x": -5}}, "expected": 5}, {"input": {"expression": "max(sqrt(16), abs(-3))", "variables": {}}, "expected": 4}]}',
ARRAY['parsing', 'recursion', 'math']),

-- 48
('c1000000-0000-0000-0000-000000000048', 'Persistent Red-Black Tree', 'hard',
E'Implement a persistent (functional) Red-Black tree that supports:\n\n- `insert(version, key, value)`: Returns a new version with the key-value pair inserted.\n- `delete(version, key)`: Returns a new version with the key removed.\n- `get(version, key)`: Return the value for key in the given version, or null.\n- `range(version, lo, hi)`: Return all key-value pairs with lo <= key <= hi, sorted by key.\n\nPersistence means no version is ever modified - each operation creates a new version by path-copying only the modified nodes.\n\nVersions are numbered starting from 0 (the empty tree).\n\nProcess operations and return results of get and range queries.',
ARRAY['1 <= operations.length <= 10^4', 'Keys are integers.', 'Values are integers.'],
'{"javascript": "function persistentRBTree(operations) {\n  // your code here\n}", "python": "def persistent_rb_tree(operations):\n    pass"}',
'{"public": [{"input": {"operations": [["insert", 0, 5, 50], ["insert", 1, 3, 30], ["insert", 2, 7, 70], ["get", 3, 5], ["get", 1, 3], ["range", 3, 3, 7], ["delete", 3, 5], ["get", 4, 5], ["get", 3, 5]]}, "expected": [50, null, [[3,30],[5,50],[7,70]], null, 50]}], "hidden": [{"input": {"operations": [["insert", 0, 1, 10], ["insert", 0, 2, 20], ["get", 1, 1], ["get", 2, 2], ["get", 1, 2], ["get", 2, 1]]}, "expected": [10, 20, null, null]}, {"input": {"operations": [["get", 0, 1]]}, "expected": [null]}]}',
ARRAY['trees', 'design']),

-- 49
('c1000000-0000-0000-0000-000000000049', 'Extended Euclidean Algorithm and CRT', 'hard',
E'Implement a solver for systems of linear congruences using the Chinese Remainder Theorem (CRT) with the Extended Euclidean Algorithm.\n\nGiven a system:\n```\nx ≡ a1 (mod m1)\nx ≡ a2 (mod m2)\n...\nx ≡ ak (mod mk)\n```\n\nFind the smallest non-negative `x` that satisfies all congruences simultaneously, or determine that no solution exists.\n\nThe moduli are **not necessarily pairwise coprime** - handle the general case where moduli may share common factors.\n\nAlso implement:\n- `modInverse(a, m)`: Return the modular inverse of a mod m, or -1 if it doesn''t exist.\n- `discreteLog(g, h, p)`: Solve g^x ≡ h (mod p) using baby-step giant-step. Return smallest non-negative x, or -1.\n\nProcess operations and return results.',
ARRAY['1 <= moduli <= 10^9', '0 <= remainders < moduli', '1 <= operations.length <= 100'],
'{"javascript": "function numberTheory(operations) {\n  // your code here\n}", "python": "def number_theory(operations):\n    pass"}',
'{"public": [{"input": {"operations": [["crt", [[2,3],[3,5],[2,7]]], ["modInverse", 3, 7], ["discreteLog", 2, 8, 13]]}, "expected": [23, 5, 3]}], "hidden": [{"input": {"operations": [["crt", [[1,2],[2,3]]], ["crt", [[0,2],[0,4]]]]}, "expected": [5, 0]}, {"input": {"operations": [["crt", [[1,2],[0,2]]]]}, "expected": [-1]}, {"input": {"operations": [["modInverse", 2, 4]]}, "expected": [-1]}, {"input": {"operations": [["discreteLog", 3, 7, 11]]}, "expected": ["__validator__dlog"]}]}',
ARRAY['math']),

-- 50
('c1000000-0000-0000-0000-000000000050', 'Paxos Consensus Simulation', 'hard',
E'Simulate the single-decree Paxos consensus protocol.\n\nPaxos involves three roles: Proposers, Acceptors, and Learners.\n\nPhase 1 (Prepare):\n- Proposer sends Prepare(n) to all acceptors.\n- Acceptor responds with Promise(n, accepted_proposal) if n > highest_seen.\n\nPhase 2 (Accept):\n- If proposer receives promises from a majority, it sends Accept(n, v).\n- If the proposer received any previously accepted values, it must use the value from the highest-numbered accepted proposal.\n- Acceptor accepts if n >= highest_promised.\n\nLearning:\n- When a majority of acceptors accept the same proposal, the value is chosen.\n\nGiven a sequence of events (messages, timeouts, network drops), simulate the protocol and return:\n- The final state of each node\n- Which value (if any) was chosen\n- The sequence of all messages sent\n\nHandle network partitions, message reordering, and competing proposers.',
ARRAY['3 <= acceptors <= 7 (must be odd)', '1 <= proposers <= 3', '1 <= events.length <= 100'],
'{"javascript": "function paxosSimulation(config, events) {\n  // your code here\n}", "python": "def paxos_simulation(config, events):\n    pass"}',
'{"public": [{"input": {"config": {"acceptors": 3, "proposers": 1}, "events": [{"type": "propose", "proposer": 0, "value": "A"}, {"type": "deliver_all"}]}, "expected": {"chosenValue": "A", "proposerStates": [{"state": "decided", "value": "A"}], "acceptorStates": "__validator__paxos"}}], "hidden": [{"input": {"config": {"acceptors": 3, "proposers": 2}, "events": [{"type": "propose", "proposer": 0, "value": "A"}, {"type": "propose", "proposer": 1, "value": "B"}, {"type": "deliver_all"}]}, "expected": "__validator__paxos_consensus"}, {"input": {"config": {"acceptors": 5, "proposers": 1}, "events": [{"type": "propose", "proposer": 0, "value": "X"}, {"type": "drop_messages", "to": [3, 4]}, {"type": "deliver_all"}]}, "expected": {"chosenValue": "X", "proposerStates": "__validator__paxos", "acceptorStates": "__validator__paxos"}}]}',
ARRAY['simulation', 'design']);


-- ===================== EXAMPLES =====================

INSERT INTO examples (challenge_id, input, output, explanation) VALUES

-- Aho-Corasick Multi-Pattern Search
('c1000000-0000-0000-0000-000000000001', 'text = "abcabcabc", patterns = ["abc", "bc", "cab"]', '[{pattern:"abc",index:0},{pattern:"bc",index:1},...]', 'All patterns found simultaneously in a single pass through the text.'),

-- Suffix Automaton Construction
('c1000000-0000-0000-0000-000000000002', 's = "abcbc", queries = ["bc", "abc", "d"]', '[{count:2,first:1},{count:1,first:0},{count:0,first:-1}]', '"bc" appears twice (at indices 1 and 3), "abc" once, "d" never.'),

-- Van Emde Boas Tree
('c1000000-0000-0000-0000-000000000003', 'u = 16, insert 2,5,14, successor(5)', '14', 'The smallest element greater than 5 in the set {2, 5, 14} is 14.'),

-- Maximum Flow (Dinic''s)
('c1000000-0000-0000-0000-000000000004', 'n=4, graph with edges, s=0, t=3', '20', 'Dinic''s finds maximum flow of 20 through the network.'),
('c1000000-0000-0000-0000-000000000004', 'n=2, two parallel edges s=0 t=1', '8', 'Parallel edges: capacity 5 + 3 = 8.'),

-- Persistent Segment Tree
('c1000000-0000-0000-0000-000000000005', 'arr=[1,2,3,4,5], query v0 sum, update idx 2 to 10, query v1 sum, query v0 sum', '[15, 22, 15]', 'Version 0 preserved with sum 15. Version 1 has updated value, sum 22.'),

-- Convex Hull
('c1000000-0000-0000-0000-000000000006', 'points with interior point at (0.5, 0.5)', '[[0,0],[1,0],[1,1],[0,1]]', 'Interior point (0.5,0.5) is excluded. Hull is the four corners.'),

-- Heavy-Light Decomposition
('c1000000-0000-0000-0000-000000000007', 'tree with 5 nodes, query path max 3->4', '5', 'Path 3->1->4, max value along path = max(3, 5, 4) = 5.'),

-- Minimum Cost Maximum Flow
('c1000000-0000-0000-0000-000000000008', 'n=4, edges with costs', '{maxFlow:3, minCost:8}', 'Push 3 units total, choosing cheapest augmenting paths first.'),

-- Centroid Decomposition
('c1000000-0000-0000-0000-000000000009', 'tree, count_within(1, 1)', '3', 'Nodes within distance 1 from node 1: nodes 0, 1, 2 (distances 1, 0, 1).'),

-- Burrows-Wheeler Transform
('c1000000-0000-0000-0000-000000000010', 'encode("banana")', '{bwt:"annb$aa", row:4}', 'All rotations sorted, last column extracted. Original at row 4.'),
('c1000000-0000-0000-0000-000000000010', 'decode("annb$aa", 4)', '"banana"', 'Reconstruct original string from BWT output.'),

-- Dancing Links (Exact Cover)
('c1000000-0000-0000-0000-000000000011', 'binary matrix', '[[1,3,5]]', 'Rows 1, 3, 5 together cover every column exactly once.'),

-- Treap with Split and Merge
('c1000000-0000-0000-0000-000000000012', 'insert 5,3,7 then kth(1)', '3', 'After inserting 5, 3, 7: the 1st smallest is 3.'),

-- SAT Solver (DPLL)
('c1000000-0000-0000-0000-000000000013', 'clauses [[1,-2],[2,3],[-1,-3]]', '{satisfiable: true, assignment: {1:true,2:true,3:false}}', 'x1=T, x2=T, x3=F satisfies all clauses.'),
('c1000000-0000-0000-0000-000000000013', 'clauses [[1],[-1],[2]]', '{satisfiable: false}', 'x1 must be both true and false, impossible.'),

-- Strongly Connected Components
('c1000000-0000-0000-0000-000000000014', 'n=5, directed edges', '[[4],[3],[0,1,2]]', 'Three SCCs found in reverse topological order.'),

-- Earley Parser
('c1000000-0000-0000-0000-000000000015', 'grammar S->aSb|ab, input "aabb"', '{accepted:true, tree:{symbol:"S",...}}', 'String "aabb" matches the nested production S->aSb with S->ab inside.'),

-- Rope Data Structure
('c1000000-0000-0000-0000-000000000016', 'build "Hello World", charAt(4), insert(5, ",")', '["o", "Hello, World"]', 'charAt returns "o". After insert, toString gives "Hello, World".'),

-- Raft Consensus
('c1000000-0000-0000-0000-000000000017', 'n=3, node 0 times out and wins election', '[{state:"leader",...},...]', 'Node 0 becomes candidate, gets majority vote, becomes leader.'),

-- Hungarian Algorithm
('c1000000-0000-0000-0000-000000000018', 'cost = [[9,2,7,8],[6,4,3,7],[5,8,1,8],[7,6,9,4]]', '{totalCost:13, assignment:[1,0,2,3]}', 'Worker 0->Job 1 (cost 2), Worker 1->Job 0 (cost 6), etc. Total=13.'),

-- Wavelet Tree
('c1000000-0000-0000-0000-000000000019', 'arr=[3,1,4,1,5,9,2,6], quantile(0,7,3)', '3', 'The 3rd smallest in the full array [1,1,2,3,4,5,6,9] is 3.'),

-- Palindromic Tree
('c1000000-0000-0000-0000-000000000020', 's = "abacaba", count distinct palindromes', '7', 'Distinct palindromes: a, b, c, aba, aca, bacab, abacaba (plus single chars).'),

-- Dominator Tree
('c1000000-0000-0000-0000-000000000021', 'n=6, entry=0, various edges', '[-1, 0, 0, 0, 3, 0]', 'Immediate dominators computed. Node 0 dominates everything.'),

-- Z-Buffer Renderer
('c1000000-0000-0000-0000-000000000022', 'width=5, height=5, one triangle', '5x5 framebuffer with rasterized triangle', 'Pixels inside the triangle projection get the triangle''s color.'),

-- Interval Scheduling with Weighted Jobs
('c1000000-0000-0000-0000-000000000023', 'jobs with start/end/profit', '{maxProfit:140, selectedJobs:[0,2,3]}', 'Jobs 0, 2, 3 are non-overlapping with max total profit.'),

-- Regex to NFA to DFA
('c1000000-0000-0000-0000-000000000024', 'regex = "a(b|c)*", test "abc"', 'true', 'The DFA accepts strings starting with "a" followed by any mix of b and c.'),

-- Gomoku AI
('c1000000-0000-0000-0000-000000000025', 'board near winning state, player 1', '[row, col] completing 5-in-a-row', 'AI detects the winning move using alpha-beta search.'),

-- B-Tree Insert and Delete
('c1000000-0000-0000-0000-000000000026', 't=2, insert 10,20,5,6,12, inorder', '[5,6,10,12,20]', 'B-tree maintains sorted order with proper node splitting.'),

-- Fenwick Tree 2D
('c1000000-0000-0000-0000-000000000027', '4x4 grid, update rectangle, query point', '[1, 9, 27]', 'Range updates and point/range queries on 2D grid.'),

-- Link-Cut Trees
('c1000000-0000-0000-0000-000000000028', 'link nodes, query connectivity and path sums', '[true, 6, false]', 'Dynamic tree operations with link, cut, and path queries.'),

-- Hopcroft-Karp
('c1000000-0000-0000-0000-000000000029', 'bipartite graph 3+3', '{matchingSize:3, matching:[[0,1],[1,0],[2,2]]}', 'Maximum matching found using alternating BFS+DFS layers.'),

-- Pollard''s Rho
('c1000000-0000-0000-0000-000000000030', 'n = 1234567890', '[2, 3, 3, 5, 3607, 3803]', 'Complete prime factorization using Pollard''s Rho with Miller-Rabin.'),

-- Implicit Treap
('c1000000-0000-0000-0000-000000000031', 'insert [1,2,3,4,5], reverse [1,3], toArray', '[[1,2,3,4,5], [1,4,3,2,5], 15]', 'Subarray reversal via implicit key treap with lazy propagation.'),

-- CYK Parser
('c1000000-0000-0000-0000-000000000032', 'CNF grammar, input "ab"', '{accepted:true, tree:{S->[A,B]}}', 'CYK fills the parse table bottom-up to find a valid parse.'),

-- Edmonds'' Blossom Algorithm
('c1000000-0000-0000-0000-000000000033', 'square graph 4 nodes', '{matchingSize:2, matching:[[0,1],[2,3]]}', 'Maximum matching in non-bipartite graph handles odd cycles.'),

-- Compiler TAC Generator
('c1000000-0000-0000-0000-000000000034', 'AST for x = a + 1', '["t1 = a + 1", "x = t1"]', 'Expression decomposed into three-address code.'),

-- Suffix Tree (Ukkonen)
('c1000000-0000-0000-0000-000000000035', 's = "banana", search "ana"', 'true', 'Suffix tree built in linear time, pattern found by traversing edges.'),
('c1000000-0000-0000-0000-000000000035', 's = "banana", longestRepeatedSubstring', '"ana"', '"ana" appears twice (at positions 1 and 3).'),

-- Gauss-Jordan over GF(2)
('c1000000-0000-0000-0000-000000000036', 'A=[[1,0,1],[0,1,1],[1,1,0]], b=[1,0,1]', '{solvable:true, solution:[1,0,0]}', 'XOR-based linear system solved via Gaussian elimination.'),

-- Minimum Steiner Tree
('c1000000-0000-0000-0000-000000000037', 'graph, terminals [0,2,4]', '6', 'Minimum weight tree connecting all terminals via Dreyfus-Wagner DP.'),

-- FFT Polynomial Multiplication
('c1000000-0000-0000-0000-000000000038', 'a = [1,2,3], b = [4,5]', '[4, 13, 22, 15]', '(1+2x+3x^2)(4+5x) = 4+13x+22x^2+15x^3.'),

-- Voronoi Diagram
('c1000000-0000-0000-0000-000000000039', '3 points, bounding box', 'Voronoi vertices and edges', 'Fortune''s sweep line computes the Voronoi tessellation.'),

-- Lock-Free Queue
('c1000000-0000-0000-0000-000000000040', 'concurrent enqueue then dequeue', '[1, 2]', 'FIFO order maintained despite concurrent operations.'),

-- Minimum Cut (Stoer-Wagner)
('c1000000-0000-0000-0000-000000000041', 'n=4, weighted edges', '{minCutWeight:5, partition:[1]}', 'Stoer-Wagner finds the globally minimum cut.'),

-- Optimal Alphabetic BST
('c1000000-0000-0000-0000-000000000042', 'keys with freqs, gap freqs', '12', 'Minimum expected cost maintaining alphabetical key order.'),

-- Mo''s Algorithm
('c1000000-0000-0000-0000-000000000043', 'arr = [1,2,1,3,2,1], queries [[0,3],[1,4],[2,5]]', '[3, 3, 3]', 'Each range has 3 distinct values. Mo''s processes queries offline efficiently.'),

-- Simplex Method
('c1000000-0000-0000-0000-000000000044', 'maximize 3x+2y subject to constraints', '{status:"optimal", optimalValue:11, solution:[3,1]}', 'Simplex finds optimal vertex of feasible polytope.'),

-- Minimal Perfect Hash
('c1000000-0000-0000-0000-000000000045', 'keys = ["apple","banana","cherry"]', 'unique hash values in [0,3)', 'CHD algorithm creates a bijection from keys to [0,n).'),

-- Interval Graph Coloring
('c1000000-0000-0000-0000-000000000046', 'intervals [[1,3],[2,5],[4,7],[6,9]]', '{chromaticNumber:2,...}', 'Maximum overlap of 2 intervals at any point determines chromatic number.'),

-- Pratt Parser
('c1000000-0000-0000-0000-000000000047', 'expression = "2 ^ 3 ^ 2"', '512', 'Right-associative: 2^(3^2) = 2^9 = 512.'),
('c1000000-0000-0000-0000-000000000047', 'expression = "5!"', '120', 'Postfix factorial: 5! = 120.'),

-- Persistent Red-Black Tree
('c1000000-0000-0000-0000-000000000048', 'insert 5,3,7 across versions, get from old version', '[50, null, ...]', 'Old versions remain queryable after new insertions.'),

-- Extended Euclidean and CRT
('c1000000-0000-0000-0000-000000000049', 'CRT: x≡2(mod 3), x≡3(mod 5), x≡2(mod 7)', '23', 'Smallest non-negative x satisfying all three congruences is 23.'),

-- Paxos Consensus
('c1000000-0000-0000-0000-000000000050', 'single proposer, 3 acceptors, propose "A"', '{chosenValue:"A",...}', 'Paxos reaches consensus on value "A" after prepare and accept phases.');
