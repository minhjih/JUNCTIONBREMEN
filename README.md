How to set environment
1. python -m venv .venv
2. virtual/Scripts/activate
   in ubuntu: source venv/bin/activate
3. pip install -r requirements.txt

then flask run

end venv:
   window: venv/Scripts/deactivate
   ubunt: deactivate

after any update, INSIDE THE VENV, do this:
pip freeze > requirements.txt 
