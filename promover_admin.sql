-- Rode este comando no SQL Editor do Supabase para promover um usuário a administrador.
-- Troque o e-mail abaixo pelo e-mail da conta que você já criou no dashboard GRisc.

UPDATE public.perfis
SET papel = 'admin'
WHERE email = 'SEU_EMAIL_AQUI@exemplo.com';

-- Para conferir quem são os admins atuais:
SELECT id, email, papel, criado_em FROM public.perfis ORDER BY criado_em;
