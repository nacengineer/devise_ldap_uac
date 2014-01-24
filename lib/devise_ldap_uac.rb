require "devise_ldap_uac/version"
require "devise_ldap_authenticatable"

module DeviseLdapUac
  # Based on this KB article http://support.microsoft.com/kb/305144
  PROPERTY_FLAGS = [
    "SCRIPT",
    "ACCOUNTDISABLE",
    "HOMEDIR_REQUIRED",
    "LOCKOUT",
    "PASSWD_NOTREQD",
    "PASSWD_CANT_CHANGE",
    "ENCRYPTED_TEXT_PWD_ALLOWED",
    "TEMP_DUPLICATE_ACCOUNT",
    "NORMAL_ACCOUNT",
    "INTERDOMAIN_TRUST_ACCOUNT",
    "WORKSTATION_TRUST_ACCOUNT",
    "SERVER_TRUST_ACCOUNT",
    "DONT_EXPIRE_PASSWORD",
    "MNS_LOGON_ACCOUNT",
    "SMARTCARD_REQUIRED",
    "TRUSTED_FOR_DELEGATION",
    "NOT_DELEGATED",
    "USE_DES_KEY_ONLY",
    "DONT_REQ_PREA UTH",
    "PASSWORD_EXP IRED",
    "TRUSTED_TO_AUTH_FOR_DELEGATION",
    "PARTIAL_SECRETS_ACCOUNT"
  ]

  def uac_flagged
    check_bitmask
    DeviseLdapUac::PROPERTY_FLAGS.reject do |r|
      ((ldap_uac || 0) & 2**DeviseLdapUac::PROPERTY_FLAGS.index(r)).zero?
    end
  end

  def uac_unflagged
    check_bitmask
    DeviseLdapUac::PROPERTY_FLAGS.keep_if do |r|
      ((ldap_uac || 0) & 2**DeviseLdapUac::PROPERTY_FLAGS.index(r)).zero?
    end
  end

  private

  def ldap_uac
    Devise::LDAP::Adapter.get_ldap_param(
      self.login, "userAccountControl"
    ).first.to_i
  end

  def check_bitmask
    if !ldap_uac.is_a?(Integer) || ldap_uac.to_i.zero?
      raise ArgumentError, "Bitmask is not an Integer"
    end
  end
end
