import 'dart:convert';
import 'dart:io';

import 'package:git/git.dart';

void getGit() {
  print('Hello git');
}

void getBranch() async {
  GitDir gitDir;
  if (await GitDir.isGitDir(Directory.current.path)) {
    gitDir = await GitDir.fromExisting(Directory.current.path,
        allowSubdirectory: true);
    var result = await gitDir.runCommand(["branch", "-r"], throwOnError: false);
    print(result.stdout);
  } else {
    return;
  }
}

Future<void> getBranchList() async {
  GitDir gitDir;
  if (await GitDir.isGitDir(Directory.current.path)) {
    gitDir = await GitDir.fromExisting(Directory.current.path,
        allowSubdirectory: true);
    var result = await gitDir.runCommand(["branch", "-r"], throwOnError: false);
    var txt = result.stdout.toString();
    List<String> lines = LineSplitter().convert(txt);

    for (var i = 0; i < lines.length; i++) {
      if (lines[i].toString().contains("HEAD")) {
      } else {
        var l = lines[i].toString().replaceAll("origin/", "");
        print('Line $i: $l');
      }
    }
  } else {
    return;
  }
}

Future<void> getCurrentBranch() async {
  GitDir gitDir;
  if (await GitDir.isGitDir(Directory.current.path)) {
    gitDir = await GitDir.fromExisting(Directory.current.path,
        allowSubdirectory: true);
    var branches = await gitDir.currentBranch();
    print(branches.branchName);
  } else {
    return;
  }
}

Future<void> checkout(String name) async {
  GitDir gitDir;
  if (await GitDir.isGitDir(Directory.current.path)) {
    gitDir = await GitDir.fromExisting(Directory.current.path,
        allowSubdirectory: true);
    var result =
        await gitDir.runCommand(["checkout", name], throwOnError: false);
    print(result.stdout);
  } else {
    return;
  }
}

Future<void> checkClean() async {
  GitDir gitDir;
  if (await GitDir.isGitDir(Directory.current.path)) {
    gitDir = await GitDir.fromExisting(Directory.current.path,
        allowSubdirectory: true);
    var result = await gitDir.isWorkingTreeClean();
    print(result);
  } else {
    return;
  }
}
