module InvitationsHelper
  def options_for_status
    Invitation::Status.constants.map do |status|
      value = status.downcase
      [t("views.invitation.status.#{value}"), value]
    end
  end
end
