#!/usr/bin/python3

import glob
import os
import subprocess
import sys


BUILD_DIRECTORY_PATH = "./build"
TEST_FILE_NAME_PATTERN = "./test/**/*_test.v"


def get_file_name(path):
	return os.path.basename(path).split(".")[0]


def build_verilog_file(input_file_path):
	if not os.path.isdir(BUILD_DIRECTORY_PATH):
		os.makedirs(BUILD_DIRECTORY_PATH)

	output_file_name = get_file_name(input_file_path) + ".vvp"
	output_file_path = os.path.join(BUILD_DIRECTORY_PATH, output_file_name)

	command = ["iverilog", "-g2012", "-o", output_file_path, input_file_path]

	subprocess.run(command, check=True)

	return output_file_path


def run_vvp_file(path):
	command = ["vvp", path]

	subprocess.run(command, check=True)


def get_verilog_test_files():
	return glob.glob(TEST_FILE_NAME_PATTERN, recursive=True)


def	build_and_run_verilog_test_files(paths):
	vvp_paths = []

	for path in paths:
		print(f"[+] Building '{path}'")

		vvp_path = None
		try:
			vvp_path = build_verilog_file(path)
		except Exception:
			print(f"[-] An error occurred while building '{path}'")
			return

		vvp_paths.append(vvp_path)

	for path in vvp_paths:
		print(f"[+] Running '{path}'")

		try:
			run_vvp_file(path)
		except Exception:
			print(f"[-] An error occurred while running '{path}'")
			return


def main():
	args = sys.argv[1:]

	if len(args) == 0:
		paths = get_verilog_test_files()

		build_and_run_verilog_test_files(paths)
	elif len(args) == 1:
		path = args[0]

		if not os.path.isfile(path):
			print(f"[-] '{path}' is not a file.")
			return

		build_and_run_verilog_test_files([path])
	else:
		print("[-] Invalid number of arguments supplied.")


if __name__ == "__main__":
	main()
