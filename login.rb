require 'mechanize'
require 'yaml'

# Mechanizeをインスタンス化
agent = Mechanize.new
# User-Agentを設定
agent.user_agent_alias = 'Mac Firefox'
# config読み込み
config = YAML.load_file('config.yml')
# ログインページを取得
page = agent.get(config['login_address'])
# 入力フォームを取得
login_form = page.forms.first
# フォームに値を割り当て
login_form.field_with(name: 'user_id').value = config['login_user']
login_form.field_with(name: 'password').value = config['login_password']
# ログイン実行
after_page = login_form.submit
# ログインできたかを確認
puts after_page.body
