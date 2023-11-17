import os

os.chdir(os.path.dirname(os.path.abspath(__file__)))

os.system("""
    fvm flutter pub get
    fvm flutter pub run build_runner build --delete-conflicting-outputs
""")