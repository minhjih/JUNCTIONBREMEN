from flask import jsonify, request, Blueprint
from dotenv import load_dotenv
from openai import OpenAI
load_dotenv()

chat_bp = Blueprint('chat_bp', __name__, url_prefix='/')

@chat_bp.route('/chatbot')
def home():
  return 'Hello, this is chatbot page!'


# 질문답변
@chat_bp.route('/chatbot/prompt', methods=['POST'])
def generate_answer():
    if request.method == 'POST':
        prompt = request.json['prompt']
        client = OpenAI()
        pre_prompt = "질문하는 사람은 임산부야. 한국어로 친절하게 대답해줘. 한두줄 이내로 짧게 부탁해. 이제 질문을 알려줄게 :)\n\n"
        response = client.chat.completions.create(
          model="gpt-3.5-turbo",
          messages=[
            {"role": "system", "content": "너는 임산부를 위한 앱의 챗봇이야."},
            {"role": "user", "content": pre_prompt + prompt}
          ],
          max_tokens=3000,
          stop=None,
          temperature=0.5
        )
        answer = response.choices[0].message.content.strip()
        return jsonify({'answer': answer}, ensure_ascii=False)
