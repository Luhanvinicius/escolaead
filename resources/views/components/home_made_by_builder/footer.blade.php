{{-- To make a editable image or text need to be add a "builder editable" class and builder identity attribute with a unique value --}}
{{-- builder identity and builder editable --}}
{{-- builder identity value have to be unique under a single file --}}

@php
    $contact_phone = site_contact_phone();
    $contact_phone_tel = site_contact_phone_tel();
    $contact_whatsapp = site_contact_whatsapp_number();
@endphp

<footer class="footer-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-4">
                <div class="footer-content">
                    <img src="{{ get_image(get_frontend_settings('light_logo')) }}" alt="system logo">
                    <p class="description builder-editable" builder-identity="1">Formacao online com foco em resultado, pratica e evolucao continua.</p>

                    <ul class="f-socials d-flex">
                        <li><a href="{{ get_frontend_settings('twitter') }}"><i class="fa-brands fa-twitter"></i></a>
                        </li>
                        <li><a href="{{ get_frontend_settings('facebook') }}"><i class="fa-brands fa-facebook-f"></i></a></li>
                        <li><a href="{{ get_frontend_settings('linkedin') }}"><i class="fa-brands fa-linkedin-in"></i></a></li>
                    </ul>
                    <div class="gradient-border2">
                        <a href="{{ route('contact.us') }}" class="gradient-border-btn">
                            Fale conosco
                            <i class="fa-solid fa-arrow-right-long ms-2"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-8 col-md-8">
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-widget">
                            <h4>Categorias</h4>
                            <ul>
                                @foreach (top_categories() as $category)
                                    <li>
                                        <a href="{{ route('courses', $category->slug) }}">
                                            {{ ucfirst($category->title) }}</a>
                                    </li>
                                @endforeach
                            </ul>
                        </div>

                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-widget">
                            <h4>Links uteis</h4>
                            <ul>
                                <li><a href="{{ route('courses') }}">Cursos</a></li>
                                <li><a href="{{ route('blogs') }}">Blog</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="footer-widget">
                            <h4>Empresa</h4>
                            <ul>
                                <li>
                                    <a href="tel:{{ $contact_phone_tel }}">
                                        Telefone:
                                        {{ $contact_phone }}
                                    </a>
                                </li>
                                @if ($contact_whatsapp)
                                    <li>
                                        <a href="https://wa.me/{{ $contact_whatsapp }}" target="_blank" rel="noopener">
                                            WhatsApp:
                                            {{ $contact_phone }}
                                        </a>
                                    </li>
                                @endif
                                <li>
                                    <a href="#">
                                        Email:
                                        {{ get_settings('system_email') }}
                                    </a>
                                </li>
                            </ul>
                            <div class="newslater-bottom">
                                <h4 class="builder-editable" builder-identity="2">Newsletter</h4>
                                <p class="description builder-editable" builder-identity="3">Receba novidades, conteudos e atualizacoes diretamente no seu e-mail.</p>
                                <form action="{{ route('newsletter.store') }}" method="post" class="newslater-form">
                                    @csrf
                                    <input type="text" name="email" class="form-control" placeholder="Seu e-mail">
                                    <button class="eBtn gradient">Enviar</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <ul class="footer-policy">
                        <li><a href="{{ route('about.us') }}">Sobre</a></li>
                        <li><a href="{{ route('privacy.policy') }}">Politica de privacidade</a></li>
                        <li><a href="{{ route('terms.condition') }}">Termos de uso</a></li>
                        <li><a href="{{ route('refund.policy') }}">Vendas e reembolsos</a></li>
                        <li><a href="{{ route('cookie.policy') }}">Politica de cookies</a></li>
                        <li><a href="{{ route('faq') }}">FAQ</a></li>
                    </ul>
                </div>
                <div class="col-lg-4">
                    <div class="copyright-text">
                        <p class="builder-editable" builder-identity="4">&copy; 2026 Todos os direitos reservados</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

</footer>

