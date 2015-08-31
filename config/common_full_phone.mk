# Inherit common SSHD stuff
$(call inherit-product, vendor/sshd/config/common_full.mk)

$(call inherit-product, vendor/sshd/config/telephony.mk)
