package kr.or.member.model.vo;

import org.springframework.context.annotation.Profile;

import kr.or.member.model.vo.KakaoProfile.Properties.KakaoAccount;
import lombok.Data;

@Data
public class KakaoProfile {
	private Long id;
	private String connected_at;
	private Properties properties;
	private KakaoAccount Kakao_account;

	public class Properties {
		private String nickname;
		public String profile_images;
		public String thumbnaul_image;

		public class KakaoAccount {
			private Boolean profile_nickname_needs_agreement;
			private Profile profile;
			private Boolean has_email;
			private Boolean email_needs_agreement;
			public Boolean is_email_valid;
			public Boolean is_email_verified;
			public String email;
			
			class Profile {
				private String nickname;
				public String thumbnail_image_url;
				public String profile_image_url;
			}
		}
	}
}
