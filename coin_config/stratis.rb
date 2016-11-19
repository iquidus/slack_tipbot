module Stratis
  PERFORM_ERROR = 'That command doesn\'t exist. valid commands: balance, deposit, tip, withdraw'
  BALANCE_REPLY_PRETEXT = 'Your balance: '
  CURRENCY_ICON = ' Stratis'
  WEALTHY_UPPER_BOUND = 100
  WEALTHY_UPPER_BOUND_POSTTEXT = ' very wealthy!'
  WEALTHY_UPPER_BOUND_EMOJI = ':moneybag:'
  BALANCE_REPLY_POSTTEXT = ' '
  DEPOSIT_PRETEXT = 'Make a deposit'
  DEPOSIT_POSTTEXT = 'this is your address'
  TIP_ERROR_TEXT = 'pls say tip @username amount'
  TIP_PRETEXT = ''
  TIP_POSTTEXT1 = 'https://chainz.cryptoid.info/strat/tx.dws?'
  TIP_POSTTEXT2 = '.htm'
  WITHDRAW_TEXT = 'Leaving so soon?'
  WITHDRAW_ICON = ':shit:'
  NETWORKINFO_ICON = ':bar_chart:'
  TOO_POOR_TEXT = 'Insufficient funds. Do not forget the fee (0.0001)'
  NO_PURPOSE_LOWER_BOUND_TEXT = 'Amount is less than 1 or missing or in the wrong order.'
  NO_PURPOSE_LOWER_BOUND = 0.00000001
  RANDOMIZED_EMOJI = ':black_joker:'
  NETWORK = 'stratis'
end
