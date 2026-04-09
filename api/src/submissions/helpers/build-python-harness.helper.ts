import { TestCase } from '../interfaces';

export function buildPythonHarness(
  userCode: string,
  fnName: string,
  testCases: TestCase[],
): string {
  const payload = Buffer.from(JSON.stringify(testCases)).toString('base64');

  return `
import base64, json, io, sys

${userCode}

__cases = json.loads(base64.b64decode('${payload}').decode('utf-8'))
__orig_print = print
__case_logs = []

def print(*args, **kwargs):
    buf = io.StringIO()
    __orig_print(*args, file=buf, **kwargs)
    __case_logs.append(buf.getvalue().rstrip())

__results = []
for i, tc in enumerate(__cases):
    __case_logs = []
    try:
        result = ${fnName}(**tc["input"])
        passed = json.dumps(result, sort_keys=True) == json.dumps(tc["expected"], sort_keys=True)
        __results.append({"case": i, "passed": passed, "result": result, "expected": tc["expected"], "logs": list(__case_logs)})
    except Exception as e:
        __results.append({"case": i, "passed": False, "result": None, "error": str(e), "expected": tc["expected"], "logs": list(__case_logs)})

__orig_print(json.dumps({"results": __results}))
`;
}
