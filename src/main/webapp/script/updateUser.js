window.onload = () => {
    const emailDomainSelect = document.getElementById('emailDomain');
    const customDomainContainer = document.getElementById('customDomainContainer');
    const customDomainInput = document.getElementById('customDomain');
    const nicknameInput = document.getElementById('nickname');
    const emailLocalInput = document.getElementById('emailLocal');
    const checkNicknameBtn = document.getElementById('checkNicknameBtn');
    const checkEmailBtn = document.getElementById('checkEmailBtn');
    const nicknameMessage = document.getElementById('nicknameMessage');
    const emailMessage = document.getElementById('emailMessage');
    const passwordMatchMessage = document.getElementById('passwordMatchMessage');
    const currentPasswordInput = document.getElementById('currentPassword');
    const newPasswordInput = document.getElementById('newPassword');
    const confirmPasswordInput = document.getElementById('confirmPassword');
    const passwordErrorMessage = document.getElementById('passwordErrorMessage'); // 비밀번호 오류 메시지

    const originalNickname = document.getElementById('originalNickname').value.trim();
    const originalEmail = document.getElementById('originalEmail').value.trim();

    let isNicknameChecked = true;
    let isEmailChecked = true;

    // ===== 닉네임 입력 이벤트 =====
    nicknameInput.addEventListener('input', () => {
        if (nicknameInput.value.trim() !== originalNickname) {
            isNicknameChecked = false;
            checkNicknameBtn.style.display = 'inline-block';
            nicknameMessage.textContent = '';
        } else {
            isNicknameChecked = true;
            checkNicknameBtn.style.display = 'none';
        }
    });

    checkNicknameBtn.addEventListener('click', () => {
        const nickname = nicknameInput.value.trim();
        fetch(`./checkNickName.do?nickName=${nickname}`)
            .then(response => response.json())
            .then(data => {
                if (data.exists) {
                    nicknameMessage.textContent = '닉네임이 중복됩니다.';
                    nicknameMessage.className = 'message error';
                    isNicknameChecked = false;
                } else {
                    nicknameMessage.textContent = '닉네임 사용 가능합니다.';
                    nicknameMessage.className = 'message success';
                    isNicknameChecked = true;
                }
            })
            .catch(() => {
                nicknameMessage.textContent = '닉네임 확인 중 문제가 발생했습니다.';
                nicknameMessage.className = 'message error';
                isNicknameChecked = false;
            });
    });

    // ===== 이메일 입력 이벤트 =====
    const updateEmailState = () => {
        const email = `${emailLocalInput.value}@${customDomainInput.value || emailDomainSelect.value}`;
        if (email !== originalEmail) {
            isEmailChecked = false;
            checkEmailBtn.style.display = 'inline-block';
            emailMessage.textContent = '';
        } else {
            isEmailChecked = true;
            checkEmailBtn.style.display = 'none';
        }
    };

    [emailLocalInput, emailDomainSelect, customDomainInput].forEach(input => {
        input.addEventListener('input', updateEmailState);
    });

    emailDomainSelect.addEventListener('change', () => {
        if (emailDomainSelect.value === 'custom') {
            customDomainContainer.style.display = 'block';
        } else {
            customDomainContainer.style.display = 'none';
            customDomainInput.value = '';
        }
        updateEmailState();
    });

    checkEmailBtn.addEventListener('click', () => {
        const email = `${emailLocalInput.value}@${customDomainInput.value || emailDomainSelect.value}`;
        fetch(`./checkEmail.do?email=${encodeURIComponent(email)}`)
            .then(response => response.json())
            .then(data => {
                if (data.exists) {
                    emailMessage.textContent = '이메일이 중복됩니다.';
                    emailMessage.className = 'message error';
                    isEmailChecked = false;
                } else {
                    emailMessage.textContent = '이메일 사용 가능합니다.';
                    emailMessage.className = 'message success';
                    isEmailChecked = true;
                }
            })
            .catch(() => {
                emailMessage.textContent = '이메일 확인 중 문제가 발생했습니다.';
                emailMessage.className = 'message error';
                isEmailChecked = false;
            });
    });

    // ===== 비밀번호 입력 이벤트 =====
    const checkPasswordMatch = () => {
        if (newPasswordInput.value && confirmPasswordInput.value) {
            if (newPasswordInput.value === confirmPasswordInput.value) {
                passwordMatchMessage.textContent = '비밀번호가 일치합니다.';
                passwordMatchMessage.className = 'message success';
            } else {
                passwordMatchMessage.textContent = '비밀번호가 일치하지 않습니다.';
                passwordMatchMessage.className = 'message error';
            }
        } else {
            passwordMatchMessage.textContent = '';
        }
    };

    newPasswordInput.addEventListener('input', checkPasswordMatch);
    confirmPasswordInput.addEventListener('input', checkPasswordMatch);

    // ===== 폼 제출 시 확인 =====
    document.querySelector('form').addEventListener('submit', (event) => {
        if (!isNicknameChecked) {
            event.preventDefault();
            alert('닉네임 중복 확인을 완료해주세요.');
        }
        if (!isEmailChecked) {
            event.preventDefault();
            alert('이메일 중복 확인을 완료해주세요.');
        }
        if (newPasswordInput.value && newPasswordInput.value !== confirmPasswordInput.value) {
            event.preventDefault();
            alert('새 비밀번호와 확인 비밀번호가 일치하지 않습니다.');
        }
    });

    // ===== 서버에서 비밀번호 오류 메시지 표시 =====
    if (passwordErrorMessage.textContent.trim()) {
        alert(passwordErrorMessage.textContent);
    }
};
