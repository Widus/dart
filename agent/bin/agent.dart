import 'package:agent/git/git.dart' as m;

const lineNumber = 'line-number';
void main(List<String> arguments) async {
  // m.getBranch();
  // m.getBranchApi();
  // m.getCurrentBranch();
  await m.getBranchList();
  await m.checkout("develop");
  await m.checkClean();
  await m.checkout("master");
  await m.checkClean();
}
