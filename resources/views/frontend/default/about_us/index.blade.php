@extends('layouts.default')
@push('title', get_phrase('About Us'))
@push('meta')@endpush
@push('css')@endpush
@section('content')
    <!-- Start Breadcrumb -->
    <section class="py-56" data-background="{{ asset('assets/frontend/images/breadcrumb.png') }}">
        <div class="container">
            <ul class="ul-ol d-flex align-items-center cg-17 pb-20">
                <li class="d-flex align-items-center cg-12">
                    <div class="d-flex">
                        <img src="{{ asset('assets/frontend/images/icon/home.svg') }}" alt="" />
                    </div>
                    <p class="fz-16 fw-500 lh-30 text-white">{{ get_phrase('Home') }}</p>
                </li>
                <li class="d-flex align-items-center cg-12">
                    <div class="d-flex">
                        <img src="{{ asset('assets/frontend/images/icon/arrow-right-white.svg') }}" alt="" />
                    </div>
                    <p class="fz-16 fw-500 lh-30 text-white">{{ get_phrase('About Us') }}</p>
                </li>
            </ul>
            <h4 class="fz-56 fw-600 lh-64 text-white">{{ get_phrase('About Us') }} </h4>
        </div>
    </section>
    <!-- End Breadcrumb -->

    <!-- Start About Us -->
    <section class="course-details-wraper pb-120 pt-30">
        <div class="container description-style">
            <h2>{{ get_phrase('Our Mission') }}</h2>
            <p>{{ get_phrase('At EscolaEAD, we make quality education simple, practical, and accessible for everyone.') }}</p>
            <p>{{ get_phrase('We connect students, instructors, and modern tools so learning can happen from anywhere with confidence.') }}</p>

            <h3>{{ get_phrase('What we believe') }}</h3>
            <ul>
                <li>{{ get_phrase('Learning should be clear, flexible, and focused on real progress.') }}</li>
                <li>{{ get_phrase('Technology must support people, not create complexity.') }}</li>
                <li>{{ get_phrase('Knowledge grows better in a collaborative community.') }}</li>
            </ul>
        </div>
    </section>
    <!-- End About Us -->
@endsection
@push('js')@endpush
