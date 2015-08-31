# Inherit common SSHD stuff
$(call inherit-product, vendor/sshd/config/common.mk)

$(call inherit-product, vendor/sshd/config/telephony.mk)
