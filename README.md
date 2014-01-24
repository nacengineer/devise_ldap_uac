# DeviseLdapUac

This is a simple gem which gives you a module you can mix-in to your ldap_authenticable class to read the User Acount Control Flags.

It is based on the flags specified in this [article](http://support.microsoft.com/kb/305144) from the Microsoft knowledge base.

## Installation

Add this line to your application's Gemfile:

    gem 'devise_ldap_uac'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install devise_ldap_uac

## Usage

### Assumptions
- devise_ldap_authenticable is working correctly on your User (or your prefered class).
- ruby > 2.0.0 although should work fine with ruby 1.9 variants

### How To
Essentially Mix this module into your class via

```ruby
include DeviseLdapUac
```

This will give you two methods to call on the class you mix it into:

- uac_flagged   - all UAC Properties that are set
- uac_unflagged - all UAC Properties that are **NOT** set

#### Example

```sh
2.0.0p353 :002 > u = User.first
2.0.0p353 :002 > u.uac_unflagged

2.0.0p353 :002 > u.uac_flagged
 => ["ACCOUNTDISABLE", "INTERDOMAIN_TRUST_ACCOUNT", "NOT_DELEGATED"]

2.0.0p353 :003 > u.uac_unflagged
 => ["SCRIPT", "HOMEDIR_REQUIRED", "LOCKOUT", "PASSWD_NOTREQD", "PASSWD_CANT_CHANGE", "ENCRYPTED_TEXT_PWD_ALLOWED", "TEMP_DUPLICATE_ACCOUNT", "NORMAL_ACCOUNT", "WORKSTATION_TRUST_ACCOUNT", "SERVER_TRUST_ACCOUNT", "DONT_EXPIRE_PASSWORD", "MNS_LOGON_ACCOUNT", "SMARTCARD_REQUIRED", "TRUSTED_FOR_DELEGATION", "USE_DES_KEY_ONLY", "DONT_REQ_PREA UTH", "PASSWORD_EXP IRED", "TRUSTED_TO_AUTH_FOR_DELEGATION", "PARTIAL_SECRETS_ACCOUNT"]
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
