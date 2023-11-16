import os
import subprocess
from pathlib import Path

# Function to process the hive with RegRipper
def process_hive(hive_path, report_path, regripper_path, profile):
    # Check if the hive file exists
    if hive_path.exists():
        print(f"Processing {hive_path.name}...")
        with report_path.open('w') as report_file:
            # Run RegRipper on the hive file and write the output to the report file
            subprocess.run([regripper_path, '-r', str(hive_path), '-f', profile], stdout=report_file)
    else:
        print(f"{hive_path.name} does not exist.")

# Main function
def main(hive_input_path, report_dir_path, regripper_exe_path):
    # Convert string paths to Path objects
    hive_input_path = Path(hive_input_path)
    report_dir = Path(report_dir_path)
    regripper_path = Path(regripper_exe_path)

    # Create the report directory if it doesn't exist
    report_dir.mkdir(exist_ok=True)

    # Check if the input is a file or directory
    if hive_input_path.is_file():
        # Process the single hive file
        profile = hive_input_path.stem.lower()
        report_path = report_dir / f"{profile}_report.txt"
        process_hive(hive_input_path, report_path, regripper_path, profile)
    elif hive_input_path.is_dir():
        # Process all files in the directory
        for hive_file in hive_input_path.glob('*'):
            profile = hive_file.stem.lower()
            report_path = report_dir / f"{profile}_report.txt"
            process_hive(hive_file, report_path, regripper_path, profile)
    else:
        print(f"The input path {hive_input_path} is not valid.")

if __name__ == '__main__':
    import sys

    if len(sys.argv) != 4:
        print("Usage: python autoripper.py <hive_input_path> <report_dir_path> <regripper_exe_path>")
    else:
        main(sys.argv[1], sys.argv[2], sys.argv[3])
